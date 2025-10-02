import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Application configuration loaded from .env files
class AppConfig {
  const AppConfig._();

  /// Singleton instance
  static const AppConfig instance = AppConfig._();

  /// Kakao native app key for OAuth
  String get kakaoNativeAppKey => dotenv.get('KAKAO_NATIVE_APP_KEY');

  /// API base URL
  String get apiBaseUrl => dotenv.get('API_BASE_URL');
}
