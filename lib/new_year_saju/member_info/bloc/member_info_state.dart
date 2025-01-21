part of 'member_info_bloc.dart';

enum NewYearSajuMemberInfoStatus { initial, loading, success, failure }

final class NewYearSajuMemberInfoState extends Equatable {
  const NewYearSajuMemberInfoState({
    this.status = NewYearSajuMemberInfoStatus.initial,
    this.gender = GenderType.male,
    this.birthDate = const BirthDate.pure(),
    this.birthHour = const BirthHour.pure(),
    this.birthMinute = const BirthMinute.pure(),
    this.birthTimeDisabled = false,
  });

  final NewYearSajuMemberInfoStatus status;
  final GenderType gender;
  final BirthDate birthDate;
  final BirthHour birthHour;
  final BirthMinute birthMinute;
  final bool birthTimeDisabled;

  NewYearSajuMemberInfoState copyWith({
    NewYearSajuMemberInfoStatus? status,
    GenderType? gender,
    BirthDate? birthDate,
    BirthHour? birthHour,
    BirthMinute? birthMinute,
    bool? birthTimeDisabled,
  }) {
    return NewYearSajuMemberInfoState(
      status: status ?? this.status,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      birthHour: birthHour ?? this.birthHour,
      birthMinute: birthMinute ?? this.birthMinute,
      birthTimeDisabled: birthTimeDisabled ?? this.birthTimeDisabled,
    );
  }

  @override
  List<Object> get props =>
      [status, gender, birthDate, birthHour, birthMinute, birthTimeDisabled];
}
