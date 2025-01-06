import 'package:byul_mobile/new_year_saju/view/new_year_saju_form.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:byul_mobile/new_year_saju/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:new_year_saju_repository/new_year_saju_repository.dart';

part 'new_year_saju_state.dart';
part 'new_year_saju_event.dart';

class NewYearSajuBloc extends Bloc<NewYearSajuEvent, NewYearSajuState> {
  NewYearSajuBloc({
    required NewYearSajuRepository newYearSajuRepository,
  })  : _newYearSajuRepository = newYearSajuRepository,
        super(const NewYearSajuState()) {
    on<NewYearSajuSubscriptionRequested>(_onSubscriptionRequested);
    on<NewYearSajuGenderChanged>(_onGenderChanged);
    on<NewYearSajuBirthDateChanged>(_onBirthDateChanged);
    on<NewYearSajuBirthHourChanged>(_onBirthHourChanged);
    on<NewYearSajuBirthMinuteChanged>(_onBirthMinuteChanged);
    on<NewYearSajuQuestionChanged>(_onQuestionChanged);
  }

  final NewYearSajuRepository _newYearSajuRepository;

  void _onSubscriptionRequested(NewYearSajuSubscriptionRequested event,
      Emitter<NewYearSajuState> emit) async {
    emit(state.copyWith(status: NewYearSajuStatus.loading));
    try {
      final newYearSaju = _newYearSajuRepository.sajuForm;
      final gender = Gender.dirty(newYearSaju.gender ?? GenderType.unknown);

      final birthDateTime = newYearSaju.birthDateTime ?? DateTime.now();
      final birthDate = BirthDate.dirty(
          DateTime(birthDateTime.year, birthDateTime.month, birthDateTime.day));
      final birthHour = BirthHour.dirty(birthDateTime.hour);
      final birthMinute = BirthMinute.dirty(birthDateTime.minute);
      final question = Question.dirty(newYearSaju.question ?? '');
      emit(
        state.copyWith(
          status: NewYearSajuStatus.success,
          gender: gender,
          birthDate: birthDate,
          birthHour: birthHour,
          birthMinute: birthMinute,
          question: question,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: NewYearSajuStatus.failure));
    }
  }

  void _onGenderChanged(
      NewYearSajuGenderChanged event, Emitter<NewYearSajuState> emit) {
    final gender = Gender.dirty(event.gender);

    _newYearSajuRepository.updateSajuForm(
      _newYearSajuRepository.sajuForm.copyWith(gender: gender.value),
    );

    emit(
      state.copyWith(
        gender: gender,
      ),
    );
  }

  void _onBirthDateChanged(
      NewYearSajuBirthDateChanged event, Emitter<NewYearSajuState> emit) {
    final birthDate = BirthDate.dirty(event.birthDate);

    _newYearSajuRepository.updateSajuForm(
      _newYearSajuRepository.sajuForm.copyWith(birthDateTime: event.birthDate),
    );

    emit(
      state.copyWith(
        birthDate: birthDate,
      ),
    );
  }

  void _onBirthHourChanged(
      NewYearSajuBirthHourChanged event, Emitter<NewYearSajuState> emit) {
    final birthHour = BirthHour.dirty(event.birthHour);

    final currentBirthDateTime =
        _newYearSajuRepository.sajuForm.birthDateTime ?? DateTime.now();

    _newYearSajuRepository.updateSajuForm(
      _newYearSajuRepository.sajuForm.copyWith(
        birthDateTime: DateTime(
          currentBirthDateTime.year,
          currentBirthDateTime.month,
          currentBirthDateTime.day,
          event.birthHour,
          state.birthMinute.value,
        ),
      ),
    );

    emit(
      state.copyWith(
        birthHour: birthHour,
      ),
    );
  }

  void _onBirthMinuteChanged(
      NewYearSajuBirthMinuteChanged event, Emitter<NewYearSajuState> emit) {
    final birthMinute = BirthMinute.dirty(event.birthMinute);

    final currentBirthDateTime =
        _newYearSajuRepository.sajuForm.birthDateTime ?? DateTime.now();

    _newYearSajuRepository.updateSajuForm(
      _newYearSajuRepository.sajuForm.copyWith(
        birthDateTime: DateTime(
          currentBirthDateTime.year,
          currentBirthDateTime.month,
          currentBirthDateTime.day,
          state.birthHour.value,
          event.birthMinute,
        ),
      ),
    );

    emit(
      state.copyWith(
        birthMinute: birthMinute,
      ),
    );
  }

  void _onQuestionChanged(
      NewYearSajuQuestionChanged event, Emitter<NewYearSajuState> emit) {
    final question = Question.dirty(event.question);

    _newYearSajuRepository.updateSajuForm(
      _newYearSajuRepository.sajuForm.copyWith(question: question.value),
    );

    emit(
      state.copyWith(
        question: question,
      ),
    );
  }
}
