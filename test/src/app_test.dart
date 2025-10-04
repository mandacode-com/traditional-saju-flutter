import 'package:flutter_test/flutter_test.dart';
import 'package:traditional_saju/src/config/app_config.dart';

void main() {
  group('AppConfig', () {
    test('is a singleton', () {
      expect(identical(AppConfig.instance, AppConfig.instance), isTrue);
    });

    test('returns default values when no --dart-define provided', () {
      expect(
        AppConfig.instance.kakaoNativeAppKey,
        equals(''),
      );

      expect(
        AppConfig.instance.apiBaseUrl,
        equals(''),
      );
    });
  });
}
