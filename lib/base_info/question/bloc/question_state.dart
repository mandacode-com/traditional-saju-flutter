import 'package:saju/base_info/form_status.dart';
import 'package:saju/base_info/question/model/question.dart';
import 'package:equatable/equatable.dart';

final class QuestionState extends Equatable {
  const QuestionState({
    this.status = FormStatus.initial,
    this.question = const Question.pure(),
    this.questionDisabled = false,
  });

  final FormStatus status;
  final Question question;
  final bool questionDisabled;

  QuestionState copyWith({
    FormStatus? status,
    Question? question,
    bool? questionDisabled,
  }) {
    return QuestionState(
        status: status ?? this.status,
        question: question ?? this.question,
        questionDisabled: questionDisabled ?? this.questionDisabled);
  }

  @override
  List<Object> get props => [status, question, questionDisabled];
}
