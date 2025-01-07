import 'package:equatable/equatable.dart';
import 'package:byul_mobile/new_year_saju/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_year_saju_repository/new_year_saju_repository.dart';

part 'question_state.dart';
part 'question_event.dart';

class NewYearSajuQuestionBloc
    extends Bloc<NewYearSajuQuestionEvent, NewYearSajuQuestionState> {
  NewYearSajuQuestionBloc({
    required NewYearSajuRepository newYearSajuRepository,
  })  : _newYearSajuRepository = newYearSajuRepository,
        super(const NewYearSajuQuestionState()) {
    on<QuestionSubscriptionRequested>(_onSubscriptionRequested);
    on<QuestionChanged>(_onQuestionChanged);
  }

  final NewYearSajuRepository _newYearSajuRepository;

  void _onSubscriptionRequested(QuestionSubscriptionRequested event,
      Emitter<NewYearSajuQuestionState> emit) async {
    emit(state.copyWith(status: NewYearSajuQuestionStatus.loading));
    try {
      final newYearSaju = _newYearSajuRepository.sajuForm;

      final question = Question.dirty(newYearSaju.question ?? '');

      emit(
        state.copyWith(
          status: NewYearSajuQuestionStatus.success,
          question: question,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: NewYearSajuQuestionStatus.failure));
    }
  }

  void _onQuestionChanged(
      QuestionChanged event, Emitter<NewYearSajuQuestionState> emit) {
    final question = Question.dirty(event.question);

    _newYearSajuRepository.updateSajuForm(
      _newYearSajuRepository.copyWith(question: question.value),
    );

    emit(
      state.copyWith(question: question),
    );
  }
}
