/// DTO for login request
/// Note: This is sent as query param (provider) and header (Authorization)
class LoginRequestDto {
  const LoginRequestDto({
    required this.provider,
    required this.oauthAccessToken,
  });

  /// OAuth provider (google or kakao)
  final String provider;

  /// OAuth provider's access token from Google Sign-In SDK or Kakao SDK
  final String oauthAccessToken;

  Map<String, dynamic> toJson() {
    return {
      'provider': provider,
      'oauthAccessToken': oauthAccessToken,
    };
  }
}
