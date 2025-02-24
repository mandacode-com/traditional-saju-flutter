part of 'member_info_bloc.dart';

sealed class YearlySajuMemberInfoEvent extends Equatable {
  const YearlySajuMemberInfoEvent();

  @override
  List<Object> get props => [];
}

final class MemberInfoSubscriptionRequested extends YearlySajuMemberInfoEvent {
  const MemberInfoSubscriptionRequested();
}

final class MemberInfoGenderChanged extends YearlySajuMemberInfoEvent {
  const MemberInfoGenderChanged(this.gender);

  final Gender gender;

  @override
  List<Object> get props => [gender];
}

final class MemberInfoBirthDateChanged extends YearlySajuMemberInfoEvent {
  const MemberInfoBirthDateChanged(this.birthDate);

  final DateTime birthDate;

  @override
  List<Object> get props => [birthDate];
}

final class MemberInfoBirthHourChanged extends YearlySajuMemberInfoEvent {
  const MemberInfoBirthHourChanged(this.birthHour);

  final int birthHour;

  @override
  List<Object> get props => [birthHour];
}

final class MemberInfoBirthMinuteChanged extends YearlySajuMemberInfoEvent {
  const MemberInfoBirthMinuteChanged(this.birthMinute);

  final int birthMinute;

  @override
  List<Object> get props => [birthMinute];
}

final class MemberInfoBirthTimeDisabledChanged extends YearlySajuMemberInfoEvent {
  const MemberInfoBirthTimeDisabledChanged(this.disabled);

  final bool disabled;

  @override
  List<Object> get props => [disabled];
}
