part of 'question_bloc.dart';

sealed class NewYearSajuQuestionEvent extends Equatable {
  const NewYearSajuQuestionEvent();

  @override
  List<Object> get props => [];
}

final class QuestionSubscriptionRequested extends NewYearSajuQuestionEvent {
  const QuestionSubscriptionRequested();
}

final class QuestionChanged extends NewYearSajuQuestionEvent {
  const QuestionChanged(this.question);

  final String question;

  @override
  List<Object> get props => [question];
}
