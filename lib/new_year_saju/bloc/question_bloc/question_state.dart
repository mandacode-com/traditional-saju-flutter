part of 'question_bloc.dart';

enum NewYearSajuQuestionStatus { initial, loading, success, failure }

final class NewYearSajuQuestionState extends Equatable {
  const NewYearSajuQuestionState({
    this.status = NewYearSajuQuestionStatus.initial,
    this.question = const Question.pure(),
  });

  final NewYearSajuQuestionStatus status;
  final Question question;

  NewYearSajuQuestionState copyWith({
    NewYearSajuQuestionStatus? status,
    Question? question,
  }) {
    return NewYearSajuQuestionState(
        status: status ?? this.status, question: question ?? this.question);
  }

  @override
  List<Object> get props => [status, question];
}
