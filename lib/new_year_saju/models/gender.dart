import 'package:formz/formz.dart';
import 'package:new_year_saju_repository/new_year_saju_repository.dart';

enum GenderValidationError { invalid }

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
