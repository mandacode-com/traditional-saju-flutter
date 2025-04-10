part of 'user_info.dart';

/// [JobStatus] Job status enum
enum JobStatus {
  /// [unemployed]
  unemployed,

  /// [employed]
  employed,

  /// [student]
  student,
  ;

  /// [text] text getter
  String get text {
    switch (this) {
      case JobStatus.unemployed:
        return 'unemployed';
      case JobStatus.employed:
        return 'employed';
      case JobStatus.student:
        return 'student';
    }
  }

  /// [textKor] text getter in Korean
  String get textKor {
    switch (this) {
      case JobStatus.unemployed:
        return '실업';
      case JobStatus.employed:
        return '취업';
      case JobStatus.student:
        return '학생';
    }
  }
}
