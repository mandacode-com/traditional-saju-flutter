import 'package:byul_mobile/yearly_saju/form_status.dart';
import 'package:byul_mobile/yearly_saju/question/bloc/question_state.dart';
import 'package:byul_mobile/yearly_saju/question/model/question.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yearly_saju_repository/yearly_saju_repository.dart';

part 'question_event.dart';

class YearlySajuQuestionBloc
    extends Bloc<YearlySajuQuestionEvent, YearlySajuQuestionState> {
  YearlySajuQuestionBloc({
    required YearlySajuRepository yearlySajuRepository,
  })  : _yearlySajuRepository = yearlySajuRepository,
        super(const YearlySajuQuestionState()) {
    on<QuestionSubscriptionRequested>(_onSubscriptionRequested);
    on<QuestionChanged>(_onQuestionChanged);
    on<QuestionDisabledChanged>(_onQuestionDisabledChanged);
  }

  final YearlySajuRepository _yearlySajuRepository;

  void _onSubscriptionRequested(QuestionSubscriptionRequested event,
      Emitter<YearlySajuQuestionState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      final yearlySajuForm = await _yearlySajuRepository.getSajuForm();

      final question = Question.dirty(yearlySajuForm.question ?? '');

      emit(
        state.copyWith(
          status: FormStatus.success,
          question: question,
          questionDisabled: yearlySajuForm.questionDisabled ?? false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FormStatus.failure));
    }
  }

  void _onQuestionChanged(
      QuestionChanged event, Emitter<YearlySajuQuestionState> emit) async {
    final question = Question.dirty(event.question);

    _yearlySajuRepository.updateSajuForm(
      question: event.question,
    );

    emit(
      state.copyWith(question: question),
    );
  }

  void _onQuestionDisabledChanged(
      QuestionDisabledChanged event, Emitter<YearlySajuQuestionState> emit) {
    _yearlySajuRepository.updateSajuForm(
      questionDisabled: event.disabled,
    );

    emit(
      state.copyWith(questionDisabled: event.disabled),
    );
  }
}
