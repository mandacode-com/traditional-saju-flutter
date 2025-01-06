part of 'new_year_saju_bloc.dart';

enum NewYearSajuStatus { initial, loading, success, failure }

final class NewYearSajuState extends Equatable {
  const NewYearSajuState({
    this.status = NewYearSajuStatus.initial,
    this.gender = const Gender.pure(),
    this.birthDate = const BirthDate.pure(),
    this.birthHour = const BirthHour.pure(),
    this.birthMinute = const BirthMinute.pure(),
    this.question = const Question.pure(),
  });

  final NewYearSajuStatus status;
  final Gender gender;
  final BirthDate birthDate;
  final BirthHour birthHour;
  final BirthMinute birthMinute;
  final Question question;

  NewYearSajuState copyWith({
    NewYearSajuStatus? status,
    Gender? gender,
    BirthDate? birthDate,
    BirthHour? birthHour,
    BirthMinute? birthMinute,
    Question? question,
  }) {
    return NewYearSajuState(
      status: status ?? this.status,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      birthHour: birthHour ?? this.birthHour,
      birthMinute: birthMinute ?? this.birthMinute,
      question: question ?? this.question,
    );
  }

  @override
  List<Object> get props =>
      [status, gender, birthDate, birthHour, birthMinute, question];
}
