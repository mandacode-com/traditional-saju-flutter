part of 'new_year_saju_bloc.dart';

sealed class NewYearSajuEvent extends Equatable {
  const NewYearSajuEvent();

  @override
  List<Object> get props => [];
}

final class NewYearSajuSubscriptionRequested extends NewYearSajuEvent {
  const NewYearSajuSubscriptionRequested();
}

final class NewYearSajuGenderChanged extends NewYearSajuEvent {
  const NewYearSajuGenderChanged(this.gender);

  final GenderType gender;

  @override
  List<Object> get props => [gender];
}

final class NewYearSajuBirthDateChanged extends NewYearSajuEvent {
  const NewYearSajuBirthDateChanged(this.birthDate);

  final DateTime birthDate;

  @override
  List<Object> get props => [birthDate];
}

final class NewYearSajuBirthHourChanged extends NewYearSajuEvent {
  const NewYearSajuBirthHourChanged(this.birthHour);

  final int birthHour;

  @override
  List<Object> get props => [birthHour];
}

final class NewYearSajuBirthMinuteChanged extends NewYearSajuEvent {
  const NewYearSajuBirthMinuteChanged(this.birthMinute);

  final int birthMinute;

  @override
  List<Object> get props => [birthMinute];
}

final class NewYearSajuQuestionChanged extends NewYearSajuEvent {
  const NewYearSajuQuestionChanged(this.question);

  final String question;

  @override
  List<Object> get props => [question];
}
