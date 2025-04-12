/// [KakaoAuthRequest] google auth request model
class KakaoAuthRequest {
  /// [KakaoAuthRequest] constructor
  KakaoAuthRequest({
    required this.accessToken,
  });

  /// [KakaoAuthRequest.fromJson] factory constructor
  factory KakaoAuthRequest.fromJson(Map<String, dynamic> json) {
    return KakaoAuthRequest(
      accessToken: json['accessToken'] as String,
    );
  }

  /// [accessToken] access token
  final String accessToken;

  /// [toJson] convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
    };
  }
}
