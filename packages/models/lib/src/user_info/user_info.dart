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
        jobStatus = jobStatus ?? JobStatus.unemployed,
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

  /// [copyWith] method
  UserInfo copyWith({
    Gender? gender,
    JobStatus? jobStatus,
    DatingStatus? datingStatus,
    DateTime? birthdate,
    bool? timeDisabled,
    bool? permanent,
  }) {
    return UserInfo(
      gender: gender ?? this.gender,
      jobStatus: jobStatus ?? this.jobStatus,
      datingStatus: datingStatus ?? this.datingStatus,
      birthdate: birthdate ?? this.birthdate,
      timeDisabled: timeDisabled ?? this.timeDisabled,
      permanent: permanent ?? this.permanent,
    );
  }
}
