import 'package:formz/formz.dart';

enum GenderValidationError { invalid }

enum GenderType { male, female, unknown }

class Gender extends FormzInput<GenderType, GenderValidationError> {
  const Gender.pure() : super.pure(GenderType.unknown);
  const Gender.dirty([super.value = GenderType.unknown]) : super.dirty();

  @override
  GenderValidationError? validator(GenderType value) {
    if (value == GenderType.unknown) {
      return GenderValidationError.invalid;
    }
    return null;
  }
}
