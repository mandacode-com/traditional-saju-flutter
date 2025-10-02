import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:traditional_saju/src/config/app_config.dart';

void main() {
  setUpAll(() {
    // Initialize dotenv with test values
    dotenv.testLoad(
      mergeWith: {
        'KAKAO_NATIVE_APP_KEY': 'test_key',
        'API_BASE_URL': 'https://saju.mandacode.com/api/v1',
      },
    );
  });

  group('AppConfig', () {
    test('returns kakaoNativeAppKey', () {
      const config = AppConfig.instance;
      expect(config.kakaoNativeAppKey, isNotEmpty);
    });

    test('returns apiBaseUrl', () {
      const config = AppConfig.instance;
      expect(config.apiBaseUrl, 'https://saju.mandacode.com/api/v1');
    });
  });
}
