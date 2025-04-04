part of 'user_info.dart';

/// [DatingStatus] Dating status enum
enum DatingStatus {
  /// [single]
  single,

  /// [dating]
  dating,

  /// [married]
  married,
  ;

  @override
  String toString() {
    switch (this) {
      case DatingStatus.single:
        return 'single';
      case DatingStatus.dating:
        return 'dating';
      case DatingStatus.married:
        return 'married';
    }
  }
}
