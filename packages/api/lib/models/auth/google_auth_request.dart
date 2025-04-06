/// [GoogleAuthRequest] google auth request model
class GoogleAuthRequest {
  /// [GoogleAuthRequest] constructor
  GoogleAuthRequest({
    required this.idToken,
    required this.accessToken,
  });

  /// [GoogleAuthRequest.fromJson] factory constructor
  factory GoogleAuthRequest.fromJson(Map<String, dynamic> json) {
    return GoogleAuthRequest(
      idToken: json['idToken'] as String,
      accessToken: json['accessToken'] as String,
    );
  }

  /// [idToken] id token
  final String idToken;

  /// [accessToken] access token
  final String accessToken;

  /// [toJson] convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'idToken': idToken,
      'accessToken': accessToken,
    };
  }
}
