part of 'today_saju_bloc.dart';

final class TodaySajuState extends Equatable {
  const TodaySajuState({
    this.gender = const Gender.pure(),
    this.birthDate = const BirthDate.pure(),
    this.birthHour = const BirthHour.pure(),
    this.birthMinute = const BirthMinute.pure(),
    this.question = const Question.pure(),
  });

  final Gender gender;
  final BirthDate birthDate;
  final BirthHour birthHour;
  final BirthMinute birthMinute;
  final Question question;

  TodaySajuState copyWith({
    Gender? gender,
    BirthDate? birthDate,
    BirthHour? birthHour,
    BirthMinute? birthMinute,
    Question? question,
  }) {
    return TodaySajuState(
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      birthHour: birthHour ?? this.birthHour,
      birthMinute: birthMinute ?? this.birthMinute,
      question: question ?? this.question,
    );
  }

  @override
  List<Object> get props => [gender, birthDate, birthHour, birthMinute, question];
}
