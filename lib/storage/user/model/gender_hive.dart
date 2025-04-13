part of 'user_info_hive.dart';

/// [Gender] enum
@HiveType(typeId: 2)
enum GenderHive {
  /// [male]
  @HiveField(0)
  male,

  /// [female]
  @HiveField(1)
  female;

  /// [GenderHive.fromRaw]
  factory GenderHive.fromRaw(Gender gender) {
    switch (gender) {
      case Gender.male:
        return GenderHive.male;
      case Gender.female:
        return GenderHive.female;
    }
  }

  /// [toRaw]
  Gender toRaw() {
    switch (this) {
      case GenderHive.male:
        return Gender.male;
      case GenderHive.female:
        return Gender.female;
    }
  }
}
