part of 'user_info_hive.dart';

/// [DatingStatusHive] is an enum class that contains the status of the dating.
@HiveType(typeId: 1)
enum DatingStatusHive {
  /// [single] is a status that the user is single.
  @HiveField(0)
  single,

  /// [dating] is a status that the user is dating.
  @HiveField(1)
  dating,

  /// [married] is a status that the user is married.
  @HiveField(2)
  married;

  /// [DatingStatusHive.fromRaw]
  factory DatingStatusHive.fromRaw(DatingStatus status) {
    switch (status) {
      case DatingStatus.single:
        return DatingStatusHive.single;
      case DatingStatus.dating:
        return DatingStatusHive.dating;
      case DatingStatus.married:
        return DatingStatusHive.married;
    }
  }

  /// [toRaw]
  DatingStatus toRaw() {
    switch (this) {
      case DatingStatusHive.single:
        return DatingStatus.single;
      case DatingStatusHive.dating:
        return DatingStatus.dating;
      case DatingStatusHive.married:
        return DatingStatus.married;
    }
  }
}
