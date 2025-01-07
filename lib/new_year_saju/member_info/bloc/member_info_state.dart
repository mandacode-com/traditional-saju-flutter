part of 'member_info_bloc.dart';

enum NewYearSajuMemberInfoStatus { initial, loading, success, failure }

final class NewYearSajuMemberInfoState extends Equatable {
  const NewYearSajuMemberInfoState({
    this.status = NewYearSajuMemberInfoStatus.initial,
    this.gender = const Gender.pure(),
    this.birthDate = const BirthDate.pure(),
    this.birthHour = const BirthHour.pure(),
    this.birthMinute = const BirthMinute.pure(),
  });

  final NewYearSajuMemberInfoStatus status;
  final Gender gender;
  final BirthDate birthDate;
  final BirthHour birthHour;
  final BirthMinute birthMinute;

  NewYearSajuMemberInfoState copyWith({
    NewYearSajuMemberInfoStatus? status,
    Gender? gender,
    BirthDate? birthDate,
    BirthHour? birthHour,
    BirthMinute? birthMinute,
  }) {
    return NewYearSajuMemberInfoState(
      status: status ?? this.status,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      birthHour: birthHour ?? this.birthHour,
      birthMinute: birthMinute ?? this.birthMinute,
    );
  }

  @override
  List<Object> get props => [status, gender, birthDate, birthHour, birthMinute];
}
