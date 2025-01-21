part of 'member_info.dart';

enum BirthDateValidationError { invalid }

class BirthDate extends FormzInput<DateTime?, BirthDateValidationError> {
  const BirthDate.pure() : super.pure(null);
  const BirthDate.dirty([super.value]) : super.dirty();

  @override
  BirthDateValidationError? validator(DateTime? value) {
    if (value == null) {
      return BirthDateValidationError.invalid;
    }
    return null;
  }
}
