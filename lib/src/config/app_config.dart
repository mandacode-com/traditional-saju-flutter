/// Application configuration loaded from .env files
class AppConfig {
  const AppConfig._();

  /// Singleton instance
  static const AppConfig instance = AppConfig._();

  /// Kakao native app key for OAuth
  String get kakaoNativeAppKey => const String.fromEnvironment(
    'KAKAO_NATIVE_APP_KEY',
  );

  /// API base URL
  String get apiBaseUrl => const String.fromEnvironment(
    'API_BASE_URL',
  );
}
