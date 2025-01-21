import 'package:byul_mobile/new_year_saju/question/model/question.dart';
import 'package:equatable/equatable.dart';

enum NewYearSajuQuestionStatus { initial, loading, success, failure }

final class NewYearSajuQuestionState extends Equatable {
  const NewYearSajuQuestionState({
    this.status = NewYearSajuQuestionStatus.initial,
    this.question = const Question.pure(),
    this.questionDisabled = false,
  });

  final NewYearSajuQuestionStatus status;
  final Question question;
  final bool questionDisabled;

  NewYearSajuQuestionState copyWith({
    NewYearSajuQuestionStatus? status,
    Question? question,
    bool? questionDisabled,
  }) {
    return NewYearSajuQuestionState(
        status: status ?? this.status,
        question: question ?? this.question,
        questionDisabled: questionDisabled ?? this.questionDisabled);
  }

  @override
  List<Object> get props => [status, question, questionDisabled];
}
