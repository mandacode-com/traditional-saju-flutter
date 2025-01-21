part of 'member_info_bloc.dart';

sealed class NewYearSajuMemberInfoEvent extends Equatable {
  const NewYearSajuMemberInfoEvent();

  @override
  List<Object> get props => [];
}

final class MemberInfoSubscriptionRequested extends NewYearSajuMemberInfoEvent {
  const MemberInfoSubscriptionRequested();
}

final class MemberInfoGenderChanged extends NewYearSajuMemberInfoEvent {
  const MemberInfoGenderChanged(this.gender);

  final GenderType gender;

  @override
  List<Object> get props => [gender];
}

final class MemberInfoBirthDateChanged extends NewYearSajuMemberInfoEvent {
  const MemberInfoBirthDateChanged(this.birthDate);

  final DateTime birthDate;

  @override
  List<Object> get props => [birthDate];
}

final class MemberInfoBirthHourChanged extends NewYearSajuMemberInfoEvent {
  const MemberInfoBirthHourChanged(this.birthHour);

  final int birthHour;

  @override
  List<Object> get props => [birthHour];
}

final class MemberInfoBirthMinuteChanged extends NewYearSajuMemberInfoEvent {
  const MemberInfoBirthMinuteChanged(this.birthMinute);

  final int birthMinute;

  @override
  List<Object> get props => [birthMinute];
}

final class MemberInfoBirthTimeDisabledChanged extends NewYearSajuMemberInfoEvent {
  const MemberInfoBirthTimeDisabledChanged(this.disabled);

  final bool disabled;

  @override
  List<Object> get props => [disabled];
}
