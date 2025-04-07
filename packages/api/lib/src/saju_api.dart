import 'package:api/models/daily_saju/daily_saju_request.dart';
import 'package:api/models/daily_saju/daily_saju_response.dart';
import 'package:api/models/yearly_saju/yearly_saju_request.dart';
import 'package:api/models/yearly_saju/yearly_saju_response.dart';
import 'package:api/src/api_client.dart';

/// [SajuApi] Saju API class
class SajuApi {
  /// [SajuApi] constructor
  SajuApi(this._apiClient);

  final ApiClient _apiClient;

  /// [dailySaju] method
  Future<DailySajuResponse> dailySaju(DailySajuRequest request) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      '/saju/daily',
      data: request.toJson(),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to load daily saju');
    }
    return DailySajuResponse.fromJson(response.data!);
  }

  /// [yearlySaju] method
  Future<YearlySajuResponse> yearlySaju(
    YearlySajuRequest request,
  ) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      '/saju/yearly',
      data: request.toJson(),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to load yearly saju');
    }
    return YearlySajuResponse.fromJson(response.data!);
  }
}
