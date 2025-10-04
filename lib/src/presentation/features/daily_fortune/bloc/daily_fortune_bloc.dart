import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traditional_saju/src/application/use_cases/saju/get_daily_fortune_use_case.dart';
import 'package:traditional_saju/src/presentation/features/daily_fortune/bloc/daily_fortune_event.dart';
import 'package:traditional_saju/src/presentation/features/daily_fortune/bloc/daily_fortune_state.dart';

/// BLoC for managing daily fortune
class DailyFortuneBloc extends Bloc<DailyFortuneEvent, DailyFortuneState> {
  DailyFortuneBloc({
    required GetDailyFortuneUseCase getDailyFortune,
  }) : _getDailyFortune = getDailyFortune,
       super(const DailyFortuneState()) {
    on<DailyFortuneLoadRequested>(_onLoadRequested);
  }

  final GetDailyFortuneUseCase _getDailyFortune;

  Future<void> _onLoadRequested(
    DailyFortuneLoadRequested event,
    Emitter<DailyFortuneState> emit,
  ) async {
    emit(state.copyWith(status: DailyFortuneStatus.loading));
    try {
      final dailyFortune = await _getDailyFortune.execute();
      emit(
        state.copyWith(
          status: DailyFortuneStatus.success,
          dailyFortune: dailyFortune,
        ),
      );
    } on FormatException catch (e) {
      emit(
        state.copyWith(
          status: DailyFortuneStatus.failure,
          error: '데이터 형식 오류: ${e.message}',
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: DailyFortuneStatus.failure,
          error: '운세를 불러오는 중 오류가 발생했습니다: $e',
        ),
      );
    }
  }
}
