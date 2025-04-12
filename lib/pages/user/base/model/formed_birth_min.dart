import 'package:formz/formz.dart';
import 'package:models/models.dart';

class FormedBirthMinutes extends FormzInput<int, FormInputError> {
  const FormedBirthMinutes.pure() : super.pure(0);
  const FormedBirthMinutes.dirty([super.value = 0]) : super.dirty();

  @override
  FormInputError? validator(int value) {
    if (value < 0 || value > 59) {
      return FormInputError.invalid;
    }
    return null;
  }
}
