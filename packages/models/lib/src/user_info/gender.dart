part of 'user_info.dart';

/// [Gender] Gender enum
enum Gender {
  /// [male]
  male,

  /// [female]
  female,
  ;

  /// [text] text getter
  String get text {
    switch (this) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
    }
  }

  /// [textKor] text getter in Korean
  String get textKor {
    switch (this) {
      case Gender.male:
        return '남성';
      case Gender.female:
        return '여성';
    }
  }
}
