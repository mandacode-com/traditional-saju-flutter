import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:saju_mobile_v1/pages/results/daily/bloc/event.dart';
import 'package:saju_mobile_v1/pages/results/daily/bloc/state.dart';

class DailySajuResultBloc
    extends Bloc<DailySajuResultEvent, DailySajuResultState> {
  DailySajuResultBloc({
    required SajuRepository sajuRepository,
  })  : _sajuRepository = sajuRepository,
        super(const DailySajuResultState()) {
    on<DailyResultSubscriptionRequested>(_onResultSubscriptionRequested);
    on<ClearDailyResultPressed>(_onResultClearPressed);
  }

  final SajuRepository _sajuRepository;

  Future<void> _onResultSubscriptionRequested(
    DailyResultSubscriptionRequested event,
    Emitter<DailySajuResultState> emit,
  ) async {
    emit(state.copyWith(formStatus: FormStatus.loading));
    try {
      final result = await _sajuRepository.dailySaju();

      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          dailySajuResponse: result,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          formStatus: FormStatus.failure,
        ),
      );
    }
  }

  Future<void> _onResultClearPressed(
    ClearDailyResultPressed envet,
    Emitter<DailySajuResultState> emit,
  ) async {
    emit(
      state.copyWith(
        formStatus: FormStatus.initial,
      ),
    );
  }
}
