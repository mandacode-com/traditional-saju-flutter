import 'package:byul_mobile/yearly_saju/form_status.dart';
import 'package:byul_mobile/yearly_saju/question/model/question.dart';
import 'package:equatable/equatable.dart';

final class YearlySajuQuestionState extends Equatable {
  const YearlySajuQuestionState({
    this.status = FormStatus.initial,
    this.question = const Question.pure(),
    this.questionDisabled = false,
  });

  final FormStatus status;
  final Question question;
  final bool questionDisabled;

  YearlySajuQuestionState copyWith({
    FormStatus? status,
    Question? question,
    bool? questionDisabled,
  }) {
    return YearlySajuQuestionState(
        status: status ?? this.status,
        question: question ?? this.question,
        questionDisabled: questionDisabled ?? this.questionDisabled);
  }

  @override
  List<Object> get props => [status, question, questionDisabled];
}
