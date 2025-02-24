import 'package:api/src/models/daily_saju_request.dart';
import 'package:api/src/models/daily_saju_response.dart';
import 'package:dio/dio.dart';

class DailySajuApi {
  DailySajuApi({required Dio client}) : _client = client;

  final Dio _client;

  Future<DailySajuResponse> generateDailySaju(DailySajuRequest request) async {
    final response = await _client
        .post(
          '/daily',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
          data: request.toJson(),
        )
        .timeout(const Duration(seconds: 30));

    if (response.statusCode != 200) {
      throw Exception('Failed to load daily saju');
    }

    final Map<String, dynamic> json = response.data;

    return DailySajuResponse.fromJson(json);
  }
}
