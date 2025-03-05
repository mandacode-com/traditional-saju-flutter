part of 'member_info_bloc.dart';

sealed class UserInfoEvent extends Equatable {
  const UserInfoEvent();

  @override
  List<Object> get props => [];
}

final class MemberInfoSubscriptionRequested extends UserInfoEvent {
  const MemberInfoSubscriptionRequested();
}

final class MemberInfoGenderChanged extends UserInfoEvent {
  const MemberInfoGenderChanged(this.gender);

  final Gender gender;

  @override
  List<Object> get props => [gender];
}

final class MemberInfoBirthDateChanged extends UserInfoEvent {
  const MemberInfoBirthDateChanged(this.birthDate);

  final DateTime birthDate;

  @override
  List<Object> get props => [birthDate];
}

final class MemberInfoBirthHourChanged extends UserInfoEvent {
  const MemberInfoBirthHourChanged(this.birthHour);

  final int birthHour;

  @override
  List<Object> get props => [birthHour];
}

final class MemberInfoBirthMinuteChanged extends UserInfoEvent {
  const MemberInfoBirthMinuteChanged(this.birthMinute);

  final int birthMinute;

  @override
  List<Object> get props => [birthMinute];
}

final class MemberInfoBirthTimeDisabledChanged extends UserInfoEvent {
  const MemberInfoBirthTimeDisabledChanged(this.disabled);

  final bool disabled;

  @override
  List<Object> get props => [disabled];
}
