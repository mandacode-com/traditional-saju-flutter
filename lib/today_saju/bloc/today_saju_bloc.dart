import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:byul_mobile/today_saju/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'today_saju_event.dart';
part 'today_saju_state.dart';

class TodaySajuBloc extends Bloc<TodaySajuEvent, TodaySajuState> {
  TodaySajuBloc() : super(const TodaySajuState()) {
    on<TodaySajuGenderChanged>(_onGenderChanged);
    on<TodaySajuBirthDateChanged>(_onBirthDateChanged);
    on<TodaySajuBirthHourChanged>(_onBirthHourChanged);
    on<TodaySajuBirthMinuteChanged>(_onBirthMinuteChanged);
    on<TodaySajuQuestionChanged>(_onQuestionChanged);
  }

  void _onGenderChanged(TodaySajuGenderChanged event, Emitter<TodaySajuState> emit) {
    final gender = Gender.dirty(event.gender);
    emit(
      state.copyWith(
        gender: gender,
      ),
    );
  }

  void _onBirthDateChanged(TodaySajuBirthDateChanged event, Emitter<TodaySajuState> emit) {
    final birthDate = BirthDate.dirty(event.birthDate);
    emit(
      state.copyWith(
        birthDate: birthDate,
      ),
    );
  }

  void _onBirthHourChanged(TodaySajuBirthHourChanged event, Emitter<TodaySajuState> emit) {
    final birthHour = BirthHour.dirty(event.birthHour);
    emit(
      state.copyWith(
        birthHour: birthHour,
      ),
    );
  }

  void _onBirthMinuteChanged(TodaySajuBirthMinuteChanged event, Emitter<TodaySajuState> emit) {
    final birthMinute = BirthMinute.dirty(event.birthMinute);
    emit(
      state.copyWith(
        birthMinute: birthMinute,
      ),
    );
  }

  void _onQuestionChanged(TodaySajuQuestionChanged event, Emitter<TodaySajuState> emit) {
    final question = Question.dirty(event.question);
    emit(
      state.copyWith(
        question: question,
      ),
    );
  }
}
