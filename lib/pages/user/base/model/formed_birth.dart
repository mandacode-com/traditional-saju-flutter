import 'package:formz/formz.dart';
import 'package:models/models.dart';

class FormedBirthDate extends FormzInput<DateTime?, FormInputError> {
  const FormedBirthDate.pure() : super.pure(null);
  const FormedBirthDate.dirty([super.value]) : super.dirty();

  @override
  FormInputError? validator(DateTime? value) {
    if (value == null) {
      return FormInputError.invalid;
    }
    return null;
  }
}
