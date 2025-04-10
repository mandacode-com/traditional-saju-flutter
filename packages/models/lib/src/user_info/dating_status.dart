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

  /// [text] text getter
  String get text {
    switch (this) {
      case DatingStatus.single:
        return 'single';
      case DatingStatus.dating:
        return 'dating';
      case DatingStatus.married:
        return 'married';
    }
  }

  /// [textKor] text getter in Korean
  String get textKor {
    switch (this) {
      case DatingStatus.single:
        return '미혼';
      case DatingStatus.dating:
        return '연애중';
      case DatingStatus.married:
        return '기혼';
    }
  }
}
