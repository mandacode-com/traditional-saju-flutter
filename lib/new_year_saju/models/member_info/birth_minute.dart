part of 'member_info.dart';

enum BirthMinuteValidationError { invalid }

class BirthMinute extends FormzInput<int, BirthMinuteValidationError> {
  const BirthMinute.pure() : super.pure(0);
  const BirthMinute.dirty([super.value = 0]) : super.dirty();

  @override
  BirthMinuteValidationError? validator(int value) {
    if (value < 0 || value > 59) {
      return BirthMinuteValidationError.invalid;
    }
    return null;
  }
}
