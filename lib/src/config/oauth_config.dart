import 'package:flutter_dotenv/flutter_dotenv.dart';

/// OAuth configuration
class OAuthConfig {
  /// Default constructor
  const OAuthConfig({
    required this.googleClientId,
    this.kakaoNativeAppKey,
  });

  /// Load configuration from environment variables
  factory OAuthConfig.fromEnv() {
    return OAuthConfig(
      googleClientId: dotenv.get('GOOGLE_CLIENT_ID'),
      kakaoNativeAppKey: dotenv.maybeGet('KAKAO_NATIVE_APP_KEY'),
    );
  }

  final String googleClientId;
  final String? kakaoNativeAppKey;
}
