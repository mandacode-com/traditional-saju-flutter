/// Application configuration loaded from .env files
class AppConfig {
  const AppConfig._();

  /// Singleton instance
  static const AppConfig instance = AppConfig._();

  /// Google client ID for OAuth
  String get googleClientId => const String.fromEnvironment(
    'GOOGLE_CLIENT_ID',
  );

  /// Google server client ID for OAuth
  String get googleServerClientId => const String.fromEnvironment(
    'GOOGLE_SERVER_CLIENT_ID',
  );

  /// Kakao native app key for OAuth
  String get kakaoNativeAppKey => const String.fromEnvironment(
    'KAKAO_NATIVE_APP_KEY',
  );

  /// API base URL
  String get apiBaseUrl => const String.fromEnvironment(
    'API_BASE_URL',
  );
}
