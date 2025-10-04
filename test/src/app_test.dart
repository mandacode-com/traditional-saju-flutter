import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:traditional_saju/src/config/app_config.dart';

void main() {
  setUpAll(() {
    // Initialize dotenv with empty values to use defaults
    dotenv.testLoad(mergeWith: {});
  });

  group('AppConfig', () {
    test('returns default kakaoNativeAppKey when env not set', () {
      const config = AppConfig.instance;
      expect(config.kakaoNativeAppKey, 'test_kakao_dev_key');
    });

    test('returns default apiBaseUrl when env not set', () {
      const config = AppConfig.instance;
      expect(config.apiBaseUrl, 'https://saju.mandacode.com/api/v1');
    });
  });
}
