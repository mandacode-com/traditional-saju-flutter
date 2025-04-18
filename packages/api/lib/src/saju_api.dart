import 'package:api/models/daily_saju/daily_saju_request.dart';
import 'package:api/models/yearly_saju/yearly_saju_request.dart';
import 'package:api/src/api_client.dart';
import 'package:dio/dio.dart';

/// [SajuApi] Saju API class
class SajuApi {
  /// [SajuApi] constructor
  const SajuApi({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// [dailySaju] method
  Future<Response<Map<String, dynamic>>> dailySaju(
    DailySajuRequest request,
    String? accessToken,
  ) async {
    return _apiClient.post<Map<String, dynamic>>(
      '/read/daily',
      data: request.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );
  }

  /// [yearlySaju] method
  Future<Response<Map<String, dynamic>>> yearlySaju(
    YearlySajuRequest request,
    String? accessToken,
  ) async {
    return _apiClient.post<Map<String, dynamic>>(
      '/read/yearly',
      data: request.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );
  }
}
