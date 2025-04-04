part of 'user_info.dart';

/// [Gender] Gender enum
enum Gender {
  /// [male]
  male,

  /// [female]
  female,
  ;

  @override
  String toString() {
    switch (this) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
    }
  }
}
