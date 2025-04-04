part 'gender.dart';
part 'job_status.dart';
part 'dating_status.dart';

/// [UserInfo] class
class UserInfo {
  /// [UserInfo] constructor
  UserInfo({
    Gender? gender,
    JobStatus? jobStatus,
    DatingStatus? datingStatus,
    DateTime? birthdate,
    bool? saved,
  })  : gender = gender ?? Gender.male,
        jobStatus = jobStatus ?? JobStatus.employed,
        datingStatus = datingStatus ?? DatingStatus.single,
        birthdate = birthdate ?? DateTime.now(),
        saved = saved ?? false;

  /// [gender]
  final Gender gender;

  /// [jobStatus]
  final JobStatus jobStatus;

  /// [datingStatus]
  final DatingStatus datingStatus;

  /// [birthdate]
  final DateTime birthdate;

  /// [saved]
  final bool saved;
}
