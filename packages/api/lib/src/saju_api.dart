import 'package:api/models/daily_saju/daily_saju_request.dart';
import 'package:api/models/daily_saju/daily_saju_response.dart';
import 'package:api/models/yearly_saju/yearly_saju_request.dart';
import 'package:api/models/yearly_saju/yearly_saju_response.dart';
import 'package:api/src/api_client.dart';
import 'package:dio/dio.dart';

/// [SajuApi] Saju API class
class SajuApi {
  /// [SajuApi] constructor
  SajuApi(this._apiClient);

  final ApiClient _apiClient;

  /// [dailySaju] method
  Future<Response<DailySajuResponse>> dailySaju(
      DailySajuRequest request) async {
    return _apiClient.post(
      '/saju/daily',
      data: request.toJson(),
    );
  }

  /// [yearlySaju] method
  Future<Response<YearlySajuResponse>> yearlySaju(
    YearlySajuRequest request,
  ) async {
    return _apiClient.post(
      '/saju/yearly',
      data: request.toJson(),
    );
  }
}
