import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

sealed class UserInfoBaseEvent extends Equatable {
  const UserInfoBaseEvent();

  @override
  List<Object> get props => [];
}

final class UserInfoBaseSubscriptionRequested extends UserInfoBaseEvent {
  const UserInfoBaseSubscriptionRequested();

  @override
  List<Object> get props => [];
}

final class UserInfoBaseGenderChanged extends UserInfoBaseEvent {
  const UserInfoBaseGenderChanged(this.gender);

  final Gender gender;

  @override
  List<Object> get props => [gender];
}

final class UserInfoBaseBirthDateChanged extends UserInfoBaseEvent {
  const UserInfoBaseBirthDateChanged(this.birthDate);

  final DateTime birthDate;

  @override
  List<Object> get props => [birthDate];
}

final class UserInfoBaseBirthHourChanged extends UserInfoBaseEvent {
  const UserInfoBaseBirthHourChanged(this.birthHour);

  final int birthHour;

  @override
  List<Object> get props => [birthHour];
}

final class UserInfoBaseBirthMinutesChanged extends UserInfoBaseEvent {
  const UserInfoBaseBirthMinutesChanged(this.birthMinutes);

  final int birthMinutes;

  @override
  List<Object> get props => [birthMinutes];
}

final class UserInfoBaseTimeDisabledChanged extends UserInfoBaseEvent {
  const UserInfoBaseTimeDisabledChanged({required this.timeDisabled});

  final bool timeDisabled;

  @override
  List<Object> get props => [timeDisabled];
}
