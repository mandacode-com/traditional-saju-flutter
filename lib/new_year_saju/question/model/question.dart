import 'package:formz/formz.dart';

enum QuestionValidationError { invalid }

class Question extends FormzInput<String, QuestionValidationError> {
  const Question.pure() : super.pure('');
  const Question.dirty([super.value = '']) : super.dirty();

  @override
  QuestionValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return QuestionValidationError.invalid;
    }
    return null;
  }
}
