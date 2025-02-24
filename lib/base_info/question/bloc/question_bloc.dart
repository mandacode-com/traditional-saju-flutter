import 'package:repository/repository.dart';
import 'package:saju/base_info/form_status.dart';
import 'package:saju/base_info/question/bloc/question_state.dart';
import 'package:saju/base_info/question/model/question.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'question_event.dart';

class YearlySajuQuestionBloc
    extends Bloc<YearlySajuQuestionEvent, YearlySajuQuestionState> {
  YearlySajuQuestionBloc({
    required UserInfoRepository userInfoRepository,
  })  : _userInfoRepository = userInfoRepository,
        super(const YearlySajuQuestionState()) {
    on<QuestionSubscriptionRequested>(_onSubscriptionRequested);
    on<QuestionChanged>(_onQuestionChanged);
    on<QuestionDisabledChanged>(_onQuestionDisabledChanged);
  }

  final UserInfoRepository _userInfoRepository;

  void _onSubscriptionRequested(QuestionSubscriptionRequested event,
      Emitter<YearlySajuQuestionState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      final yearlySajuForm = await _userInfoRepository.getUserInfo();

      final question = Question.dirty(yearlySajuForm.question);

      emit(
        state.copyWith(
          status: FormStatus.success,
          question: question,
          questionDisabled: yearlySajuForm.questionDisabled,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FormStatus.failure));
    }
  }

  void _onQuestionChanged(
      QuestionChanged event, Emitter<YearlySajuQuestionState> emit) async {
    final question = Question.dirty(event.question);

    _userInfoRepository.updateUserInfoWith(
      question: event.question,
    );

    emit(
      state.copyWith(question: question),
    );
  }

  void _onQuestionDisabledChanged(
      QuestionDisabledChanged event, Emitter<YearlySajuQuestionState> emit) {
    _userInfoRepository.updateUserInfoWith(
      questionDisabled: event.disabled,
    );

    emit(
      state.copyWith(questionDisabled: event.disabled),
    );
  }
}
