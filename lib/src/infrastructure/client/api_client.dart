import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

/// HTTP Client for API communication
class ApiClient {
  ApiClient({
    required String baseUrl,
    required FlutterSecureStorage secureStorage,
    Logger? logger,
  }) : _secureStorage = secureStorage,
       _logger = logger ?? Logger() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  late final Dio _dio;
  final FlutterSecureStorage _secureStorage;
  final Logger _logger;

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  /// Get Dio instance for making requests
  Dio get dio => _dio;

  void _setupInterceptors() {
    // Request interceptor - Add JWT token
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Skip auth for login and health endpoints
          if (options.path.contains('/auth/login') ||
              options.path.contains('/health')) {
            return handler.next(options);
          }

          final accessToken = await _secureStorage.read(key: _accessTokenKey);
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          _logger.d('Request: ${options.method} ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.d(
            'Response: ${response.statusCode} ${response.requestOptions.path}',
          );
          return handler.next(response);
        },
        onError: (error, handler) async {
          _logger.e('Error: ${error.response?.statusCode} ${error.message}');

          // Handle 401 Unauthorized - Token expired
          if (error.response?.statusCode == 401) {
            final refreshToken = await _secureStorage.read(
              key: _refreshTokenKey,
            );

            if (refreshToken != null) {
              try {
                // Attempt to refresh token
                final refreshResponse = await _dio.post<Map<String, dynamic>>(
                  '/auth/refresh',
                  data: {'refreshToken': refreshToken},
                );

                if (refreshResponse.statusCode == 200 &&
                    refreshResponse.data != null) {
                  final newAccessToken =
                      refreshResponse.data!['accessToken'] as String?;
                  final newRefreshToken =
                      refreshResponse.data!['refreshToken'] as String?;

                  if (newAccessToken != null && newRefreshToken != null) {
                    // Save new tokens
                    await Future.wait([
                      _secureStorage.write(
                        key: _accessTokenKey,
                        value: newAccessToken,
                      ),
                      _secureStorage.write(
                        key: _refreshTokenKey,
                        value: newRefreshToken,
                      ),
                    ]);

                    // Retry original request with new token
                    final opts = error.requestOptions;
                    opts.headers['Authorization'] = 'Bearer $newAccessToken';
                    final retryResponse = await _dio.fetch<dynamic>(opts);
                    return handler.resolve(retryResponse);
                  }
                }
              } catch (e) {
                _logger.e('Token refresh failed: $e');
                // Clear tokens on refresh failure
                await clearTokens();
              }
            }
          }

          return handler.next(error);
        },
      ),
    );

    // Logging interceptor
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => _logger.d(obj),
      ),
    );
  }

  /// Save authentication tokens
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _secureStorage.write(key: _accessTokenKey, value: accessToken),
      _secureStorage.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }

  /// Get access token
  Future<String?> getAccessToken() {
    return _secureStorage.read(key: _accessTokenKey);
  }

  /// Get refresh token
  Future<String?> getRefreshToken() {
    return _secureStorage.read(key: _refreshTokenKey);
  }

  /// Clear all tokens
  Future<void> clearTokens() async {
    await Future.wait([
      _secureStorage.delete(key: _accessTokenKey),
      _secureStorage.delete(key: _refreshTokenKey),
    ]);
  }

  /// Check if user is authenticated
  Future<bool> isAuthenticated() async {
    final accessToken = await getAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }
}
