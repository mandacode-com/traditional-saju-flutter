import 'package:formz/formz.dart';
import 'package:models/models.dart';

class FormedBirthHour extends FormzInput<int, FormInputError> {
  const FormedBirthHour.pure() : super.pure(0);
  const FormedBirthHour.dirty([super.value = 0]) : super.dirty();

  @override
  FormInputError? validator(int value) {
    if (value < 0 || value > 23) {
      return FormInputError.invalid;
    }
    return null;
  }
}
