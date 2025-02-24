import 'package:api/src/models/yearly_saju_response.dart';
import 'package:api/src/models/yearly_saju_request.dart';
import 'package:dio/dio.dart';

/// {@template yearly_saju_api}
/// Yearly Saju API
/// {@endtemplate}
class YearlySajuApi {
  /// {@macro yearly_saju_api}
  YearlySajuApi({required this.client});

  /// The [Client] used to make requests.
  final Dio client;

  /// {@macro yearly_saju_api}
  /// Fetch yearly saju for the given [request]
  Future<YearlySajuResponse> generateYearlySaju(YearlySajuRequest request) async {
    print(request.gender.toString().toLowerCase().split('.').last);
    final response = await client.post(
      '/yearly',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
      data: {
        'gender': request.gender.toString().toLowerCase().split('.').last,
        'birthDateTime': request.birthDateTime.toIso8601String(),
        'datingStatus':
            request.datingStatus.toString().toLowerCase().split('.').last,
        'jobStatus': request.jobStatus.toString().toLowerCase().split('.').last,
      },
    ).timeout(const Duration(seconds: 30));

    if (response.statusCode != 200) {
      throw Exception('Failed to load yearly saju');
    }

    final Map<String, dynamic> json = response.data;

    return YearlySajuResponse.fromJson(json);
  }
}
