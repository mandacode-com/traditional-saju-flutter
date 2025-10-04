import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traditional_saju/src/application/use_cases/saju/get_yearly_fortune_use_case.dart';
import 'package:traditional_saju/src/presentation/features/yearly_fortune/bloc/yearly_fortune_event.dart';
import 'package:traditional_saju/src/presentation/features/yearly_fortune/bloc/yearly_fortune_state.dart';

/// BLoC for managing yearly fortune
class YearlyFortuneBloc extends Bloc<YearlyFortuneEvent, YearlyFortuneState> {
  YearlyFortuneBloc({
    required GetYearlyFortuneUseCase getYearlyFortune,
  }) : _getYearlyFortune = getYearlyFortune,
       super(const YearlyFortuneState()) {
    on<YearlyFortuneLoadRequested>(_onLoadRequested);
  }

  final GetYearlyFortuneUseCase _getYearlyFortune;

  Future<void> _onLoadRequested(
    YearlyFortuneLoadRequested event,
    Emitter<YearlyFortuneState> emit,
  ) async {
    emit(state.copyWith(status: YearlyFortuneStatus.loading));
    try {
      final yearlyFortune = await _getYearlyFortune.execute();
      emit(
        state.copyWith(
          status: YearlyFortuneStatus.success,
          yearlyFortune: yearlyFortune,
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: YearlyFortuneStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }
}
