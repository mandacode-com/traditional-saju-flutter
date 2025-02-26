import 'package:api/src/models/yearly_saju_response.dart';
import 'package:api/src/models/yearly_saju_request.dart';
import 'package:dio/dio.dart';

/// {@template yearly_saju_api}
/// Yearly Saju API
/// {@endtemplate}
class YearlySajuApi {
  /// {@macro yearly_saju_api}
  YearlySajuApi({required Dio client}) : _client = client;

  /// The [Client] used to make requests.
  final Dio _client;

  /// {@macro yearly_saju_api}
  /// Fetch yearly saju for the given [request]
  Future<YearlySajuResponse> generateYearlySaju(
      YearlySajuRequest request) async {
    final response = await _client
        .post(
          '/yearly',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
          data: request.toJson(),
        )
        .timeout(const Duration(seconds: 120));

    if (response.statusCode != 200) {
      throw Exception('Failed to load yearly saju');
    }

    print(response.statusCode);

    final Map<String, dynamic> json = response.data;

    return YearlySajuResponse.fromJson(json);
  }
}
