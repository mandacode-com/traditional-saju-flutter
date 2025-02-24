part of 'question_bloc.dart';

sealed class QuestionEvent extends Equatable {
  const QuestionEvent();

  @override
  List<Object> get props => [];
}

final class QuestionSubscriptionRequested extends QuestionEvent {
  const QuestionSubscriptionRequested();
}

final class QuestionChanged extends QuestionEvent {
  const QuestionChanged(this.question);

  final String question;

  @override
  List<Object> get props => [question];
}

final class QuestionDisabledChanged extends QuestionEvent {
  const QuestionDisabledChanged(this.disabled);

  final bool disabled;

  @override
  List<Object> get props => [disabled];
}
