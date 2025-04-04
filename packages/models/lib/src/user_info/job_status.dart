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

  @override
  String toString() {
    switch (this) {
      case JobStatus.unemployed:
        return 'unemployed';
      case JobStatus.employed:
        return 'employed';
      case JobStatus.student:
        return 'student';
    }
  }
}
