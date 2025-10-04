import 'package:equatable/equatable.dart';
import 'package:traditional_saju/src/domain/user/value/dating_status.dart';
import 'package:traditional_saju/src/domain/user/value/gender.dart';
import 'package:traditional_saju/src/domain/user/value/job_status.dart';

enum UserInfoStatus { initial, loading, success, failure, submitted }

final class UserInfoState extends Equatable {
  const UserInfoState({
    this.status = UserInfoStatus.initial,
    this.gender = Gender.male,
    this.birthDate,
    this.birthHour = 0,
    this.birthMinutes = 0,
    this.timeUnknown = false,
    this.datingStatus = DatingStatus.single,
    this.jobStatus = JobStatus.student,
    this.permanent = false,
    this.error,
  });

  final UserInfoStatus status;
  final Gender gender;
  final DateTime? birthDate;
  final int birthHour;
  final int birthMinutes;
  final bool timeUnknown;
  final DatingStatus datingStatus;
  final JobStatus jobStatus;
  final bool permanent;
  final String? error;

  bool get isBirthDateValid => birthDate != null;
  bool get isBaseInfoValid => isBirthDateValid;

  UserInfoState copyWith({
    UserInfoStatus? status,
    Gender? gender,
    DateTime? birthDate,
    int? birthHour,
    int? birthMinutes,
    bool? timeUnknown,
    DatingStatus? datingStatus,
    JobStatus? jobStatus,
    bool? permanent,
    String? error,
  }) {
    return UserInfoState(
      status: status ?? this.status,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      birthHour: birthHour ?? this.birthHour,
      birthMinutes: birthMinutes ?? this.birthMinutes,
      timeUnknown: timeUnknown ?? this.timeUnknown,
      datingStatus: datingStatus ?? this.datingStatus,
      jobStatus: jobStatus ?? this.jobStatus,
      permanent: permanent ?? this.permanent,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    status,
    gender,
    birthDate,
    birthHour,
    birthMinutes,
    timeUnknown,
    datingStatus,
    jobStatus,
    permanent,
    error,
  ];
}
