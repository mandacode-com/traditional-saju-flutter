import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saju_api/saju_api.dart';

part 'result_event.dart';
part 'result_state.dart';

class DailySajuResultBloc
    extends Bloc<DailySajuResultEvent, DailySajuResultState> {
  DailySajuResultBloc({
    required DailySajuRepository yearlySajuRepository,
  })  : _yearlySajuRepository = yearlySajuRepository,
        super(const DailySajuResultState()) {
    on<ResultSubscriptionRequested>(_onResultSubscriptionRequested);
    on<ClearResultPressed>(_onResultClearPressed);
  }

  final DailySajuRepository _yearlySajuRepository;

  void _onResultSubscriptionRequested(ResultSubscriptionRequested event,
      Emitter<DailySajuResultState> emit) async {
    emit(state.copyWith(status: DailySajuResultStatus.loading));
    try {
      final DailySajuResult result =
          await _yearlySajuRepository.submitSajuForm();

      emit(state.copyWith(
        status: DailySajuResultStatus.success,
        result: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DailySajuResultStatus.failed,
      ));
    }
  }

  void _onResultClearPressed(
      ClearResultPressed envet, Emitter<DailySajuResultState> emit) async {
    emit(state.copyWith(status: DailySajuResultStatus.initial, result: null));
  }
}
