part of 'question_bloc.dart';

sealed class YearlySajuQuestionEvent extends Equatable {
  const YearlySajuQuestionEvent();

  @override
  List<Object> get props => [];
}

final class QuestionSubscriptionRequested extends YearlySajuQuestionEvent {
  const QuestionSubscriptionRequested();
}

final class QuestionChanged extends YearlySajuQuestionEvent {
  const QuestionChanged(this.question);

  final String question;

  @override
  List<Object> get props => [question];
}

final class QuestionDisabledChanged extends YearlySajuQuestionEvent {
  const QuestionDisabledChanged(this.disabled);

  final bool disabled;

  @override
  List<Object> get props => [disabled];
}
