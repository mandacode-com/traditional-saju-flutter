import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:saju_mobile_v1/pages/results/yearly/bloc/event.dart';
import 'package:saju_mobile_v1/pages/results/yearly/bloc/state.dart';

class YearlySajuResultBloc
    extends Bloc<YearlySajuResultEvent, YearlySajuResultState> {
  YearlySajuResultBloc({required SajuRepository sajuRepository})
    : _sajuRepository = sajuRepository,
      super(const YearlySajuResultState()) {
    on<YearlyResultSubscriptionRequested>(_onResultSubscriptionRequested);
    on<ClearYearlyResultPressed>(_onResultClearPressed);
  }

  final SajuRepository _sajuRepository;

  Future<void> _onResultSubscriptionRequested(
    YearlyResultSubscriptionRequested event,
    Emitter<YearlySajuResultState> emit,
  ) async {
    emit(state.copyWith(formStatus: FormStatus.loading));
    try {
      final result = await _sajuRepository.yearlySaju();

      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          yearlySajuResponse: result,
        ),
      );
    } catch (e) {
      emit(state.copyWith(formStatus: FormStatus.failure));
    }
  }

  Future<void> _onResultClearPressed(
    ClearYearlyResultPressed envet,
    Emitter<YearlySajuResultState> emit,
  ) async {
    emit(state.copyWith(formStatus: FormStatus.initial));
  }
}
