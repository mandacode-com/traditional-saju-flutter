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
    bool? timeDisabled,
    DateTime? birthdate,
    bool? permanent,
  })  : gender = gender ?? Gender.male,
        jobStatus = jobStatus ?? JobStatus.employed,
        datingStatus = datingStatus ?? DatingStatus.single,
        birthdate = birthdate ?? DateTime.now(),
        timeDisabled = timeDisabled ?? false,
        permanent = permanent ?? false;

  /// [gender]
  final Gender gender;

  /// [jobStatus]
  final JobStatus jobStatus;

  /// [datingStatus]
  final DatingStatus datingStatus;

  /// [birthdate]
  final DateTime birthdate;

  /// [timeDisabled]
  final bool timeDisabled;

  /// [permanent]
  final bool permanent;
}
