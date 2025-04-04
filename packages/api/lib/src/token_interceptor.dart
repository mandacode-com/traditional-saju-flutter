import 'package:dio/dio.dart';

/// [TokenInterceptor] Token interceptor for Dio
class TokenInterceptor extends Interceptor {
  /// [TokenInterceptor] constructor
  TokenInterceptor({
    required this.dio,
    required this.getAccessToken,
    required this.saveAccessToken,
    required this.getRefreshToken,
    required this.saveRefreshToken,
    required this.refreshAccessToken,
    required this.onLogout,
  });

  /// [getAccessToken] method
  final Future<String?> Function() getAccessToken;

  /// [saveAccessToken] method
  final Future<void> Function(String?) saveAccessToken;

  /// [getRefreshToken] method
  final Future<String?> Function() getRefreshToken;

  /// [saveRefreshToken] method
  final Future<void> Function(String?) saveRefreshToken;

  /// [refreshAccessToken] method
  final Future<bool> Function() refreshAccessToken;

  /// [onLogout] method
  final Future<void> Function() onLogout;

  /// [dio] Dio instance
  final Dio dio;

  Future<bool>? _refreshingFuture;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final retryRequest = err.requestOptions;

      var isRefreshed = false;
      _refreshingFuture ??= refreshAccessToken();
      try {
        isRefreshed = await _refreshingFuture!;
      } catch (e) {
        isRefreshed = false;
      } finally {
        _refreshingFuture = null;
      }

      if (isRefreshed) {
        final newAccessToken = await getAccessToken();
        retryRequest.headers['Authorization'] = 'Bearer $newAccessToken';
        final response = await dio.fetch<Response<dynamic>>(
          retryRequest,
        );
        return handler.resolve(response);
      } else {
        await onLogout();
        return handler.reject(
          DioException(
            requestOptions: retryRequest,
            response: err.response,
            type: DioExceptionType.cancel,
            error: 'Token expired',
          ),
        );
      }
    }

    return handler.next(err);
  }
}
