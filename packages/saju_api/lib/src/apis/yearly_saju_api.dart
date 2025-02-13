part of 'apis.dart';

/// {@template yearly_saju_api}
/// Yearly Saju API
/// {@endtemplate}
class YearlySajuApi {
  /// {@macro yearly_saju_api}
  YearlySajuApi({required this.client, required this.apiBaseUrl});

  /// The [Client] used to make requests.
  final Client client;

  /// The base url of the api.
  final String apiBaseUrl;

  /// {@macro yearly_saju_api}
  /// Fetch yearly saju for the given [request]
  Future<YearlySajuResult> fetchYearlySaju(YearlySajuRequest request) async {
    final response = await client
        .post(
          Uri.parse('$apiBaseUrl/yearly'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'gender': request.gender.toString().toLowerCase().split('.').last,
            'birthDateTime': request.birthDateTime.toIso8601String(),
            'datingStatus':
                request.datingStatus.toString().toLowerCase().split('.').last,
            'jobStatus':
                request.jobStatus.toString().toLowerCase().split('.').last,
          }),
        )
        .timeout(const Duration(seconds: 30));

    if (response.statusCode != 200) {
      throw Exception('Failed to load yearly saju');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    //return YearlySajuResult.fromJson(json);
    return YearlySajuResult.fromJson(json);
  }
}
