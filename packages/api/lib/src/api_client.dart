import 'package:dio/dio.dart';

/// [ApiClient] ApiClient class
class ApiClient {
  /// [ApiClient] constructor
  ApiClient({
    Dio? dio,
  }) : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: 'https://saju.mandacode.com/api/core',
                connectTimeout: const Duration(seconds: 5),
                receiveTimeout: const Duration(seconds: 5),
              ),
            );
  final Dio _dio;

  /// [get] method
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// [post] method
  Future<Response<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    return _dio.post<T>(
      path,
      data: data,
      options: options,
    );
  }

  /// [put] method
  Future<Response<T>> put<T>(
    String path, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    return _dio.put<T>(
      path,
      data: data,
      options: options,
    );
  }

  /// [delete] method
  Future<Response<T>> delete<T>(
    String path, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    return _dio.delete<T>(
      path,
      data: data,
      options: options,
    );
  }
}
