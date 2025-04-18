part of 'user_info_hive.dart';

/// [JobStatusHive] is an enum class that contains the job status of a user.
@HiveType(typeId: 3)
enum JobStatusHive {
  /// [student] is a status that the user is a student.
  @HiveField(0)
  student,

  /// [unemployed] is a status that the user is unemployed.
  @HiveField(1)
  unemployed,

  /// [employed] is a status that the user is employed.
  @HiveField(2)
  employed;

  /// [JobStatusHive.fromRaw]
  factory JobStatusHive.fromRaw(JobStatus status) {
    switch (status) {
      case JobStatus.student:
        return JobStatusHive.student;
      case JobStatus.unemployed:
        return JobStatusHive.unemployed;
      case JobStatus.employed:
        return JobStatusHive.employed;
    }
  }

  /// [toRaw]
  JobStatus toRaw() {
    switch (this) {
      case JobStatusHive.student:
        return JobStatus.student;
      case JobStatusHive.unemployed:
        return JobStatus.unemployed;
      case JobStatusHive.employed:
        return JobStatus.employed;
    }
  }
}
