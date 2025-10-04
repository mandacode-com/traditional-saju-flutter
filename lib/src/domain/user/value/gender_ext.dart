import 'package:traditional_saju/src/domain/user/value/gender.dart';

extension GenderExt on Gender {
  String get textKor {
    switch (this) {
      case Gender.male:
        return '남자';
      case Gender.female:
        return '여자';
    }
  }
}
