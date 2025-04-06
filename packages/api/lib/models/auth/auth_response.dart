/// [AuthResponse] Auth response model
class AuthResponse {
  /// [AuthResponse] constructor
  AuthResponse({
    required this.accessToken,
    required this.refreshToken,
  });

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
