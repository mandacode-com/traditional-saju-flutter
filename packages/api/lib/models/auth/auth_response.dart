/// [AuthResponse] Auth response model
class AuthResponse {
  /// [AuthResponse] constructor
  AuthResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  /// [AuthResponse.fromJson] Factory method to create an instance from JSON
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }

  /// [accessToken] Access token
  final String accessToken;

  /// [refreshToken] Refresh token
  final String refreshToken;

  /// [toJson] Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
