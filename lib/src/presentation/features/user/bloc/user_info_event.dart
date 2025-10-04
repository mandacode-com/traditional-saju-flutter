import 'package:equatable/equatable.dart';
import 'package:traditional_saju/src/domain/user/value/dating_status.dart';
import 'package:traditional_saju/src/domain/user/value/gender.dart';
import 'package:traditional_saju/src/domain/user/value/job_status.dart';

sealed class UserInfoEvent extends Equatable {
  const UserInfoEvent();

  @override
  List<Object?> get props => [];
}

// Base Info Events
final class UserInfoLoadRequested extends UserInfoEvent {
  const UserInfoLoadRequested();
}

final class UserInfoGenderChanged extends UserInfoEvent {
  const UserInfoGenderChanged(this.gender);

  final Gender gender;

  @override
  List<Object> get props => [gender];
}

final class UserInfoBirthDateChanged extends UserInfoEvent {
  const UserInfoBirthDateChanged(this.birthDate);

  final DateTime birthDate;

  @override
  List<Object> get props => [birthDate];
}

final class UserInfoBirthHourChanged extends UserInfoEvent {
  const UserInfoBirthHourChanged(this.birthHour);

  final int birthHour;

  @override
  List<Object> get props => [birthHour];
}

final class UserInfoBirthMinutesChanged extends UserInfoEvent {
  const UserInfoBirthMinutesChanged(this.birthMinutes);

  final int birthMinutes;

  @override
  List<Object> get props => [birthMinutes];
}

final class UserInfoTimeUnknownChanged extends UserInfoEvent {
  const UserInfoTimeUnknownChanged({required this.timeUnknown});

  final bool timeUnknown;

  @override
  List<Object> get props => [timeUnknown];
}

// Detail Info Events
final class UserInfoDatingStatusChanged extends UserInfoEvent {
  const UserInfoDatingStatusChanged(this.datingStatus);

  final DatingStatus datingStatus;

  @override
  List<Object> get props => [datingStatus];
}

final class UserInfoJobStatusChanged extends UserInfoEvent {
  const UserInfoJobStatusChanged(this.jobStatus);

  final JobStatus jobStatus;

  @override
  List<Object> get props => [jobStatus];
}

final class UserInfoPermanentChanged extends UserInfoEvent {
  const UserInfoPermanentChanged({required this.permanent});

  final bool permanent;

  @override
  List<Object> get props => [permanent];
}

final class UserInfoSubmitted extends UserInfoEvent {
  const UserInfoSubmitted();
}
