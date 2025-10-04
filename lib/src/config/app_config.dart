import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Application configuration loaded from .env files
class AppConfig {
  const AppConfig._();

  /// Singleton instance
  static const AppConfig instance = AppConfig._();

  /// Kakao native app key for OAuth
  String get kakaoNativeAppKey =>
      dotenv.env['KAKAO_NATIVE_APP_KEY'] ?? 'test_kakao_dev_key';

  /// API base URL
  String get apiBaseUrl =>
      dotenv.env['API_BASE_URL'] ?? 'https://saju.mandacode.com/api/v1';
}
