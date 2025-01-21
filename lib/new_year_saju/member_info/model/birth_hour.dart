part of 'member_info.dart';

enum BirthTimeValidationError { invalid }

class BirthHour extends FormzInput<int, BirthTimeValidationError> {
  const BirthHour.pure() : super.pure(0);
  const BirthHour.dirty([super.value = 0]) : super.dirty();

  @override
  BirthTimeValidationError? validator(int value) {
    if (value < 0 || value > 23) {
      return BirthTimeValidationError.invalid;
    }
    return null;
  }
}
