part of 'today_saju_bloc.dart';

sealed class TodaySajuEvent extends Equatable {
  const TodaySajuEvent();

  @override
  List<Object> get props => [];
}

final class TodaySajuGenderChanged extends TodaySajuEvent {
  const TodaySajuGenderChanged(this.gender);

  final GenderType gender;

  @override
  List<Object> get props => [gender];
}

final class TodaySajuBirthDateChanged extends TodaySajuEvent {
  const TodaySajuBirthDateChanged(this.birthDate);

  final DateTime birthDate;

  @override
  List<Object> get props => [birthDate];
}

final class TodaySajuBirthHourChanged extends TodaySajuEvent {
  const TodaySajuBirthHourChanged(this.birthHour);

  final int birthHour;

  @override
  List<Object> get props => [birthHour];
}

final class TodaySajuBirthMinuteChanged extends TodaySajuEvent {
  const TodaySajuBirthMinuteChanged(this.birthMinute);

  final int birthMinute;

  @override
  List<Object> get props => [birthMinute];
}

final class TodaySajuQuestionChanged extends TodaySajuEvent {
  const TodaySajuQuestionChanged(this.question);

  final String question;

  @override
  List<Object> get props => [question];
}
