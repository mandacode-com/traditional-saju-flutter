/// [NaverAuthRequest] google auth request model
class NaverAuthRequest {
  /// [NaverAuthRequest] constructor
  NaverAuthRequest({
    required this.accessToken,
  });

  /// [NaverAuthRequest.fromJson] factory constructor
  factory NaverAuthRequest.fromJson(Map<String, dynamic> json) {
    return NaverAuthRequest(
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
