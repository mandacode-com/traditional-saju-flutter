import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saju_api/saju_api.dart';
import 'package:yearly_saju_repository/yearly_saju_repository.dart';

part 'result_event.dart';
part 'result_state.dart';

class YearlySajuResultBloc
    extends Bloc<YearlySajuResultEvent, YearlySajuResultState> {
  YearlySajuResultBloc({
    required YearlySajuRepository yearlySajuRepository,
  })  : _yearlySajuRepository = yearlySajuRepository,
        super(const YearlySajuResultState()) {
    on<ResultSubscriptionRequested>(_onResultSubscriptionRequested);
    on<ClearResultPressed>(_onResultClearPressed);
  }

  final YearlySajuRepository _yearlySajuRepository;

  void _onResultSubscriptionRequested(ResultSubscriptionRequested event,
      Emitter<YearlySajuResultState> emit) async {
    emit(state.copyWith(status: YearlySajuResultStatus.loading));
    try {
      final YearlySajuResult result =
          await _yearlySajuRepository.submitSajuForm();

      emit(state.copyWith(
        status: YearlySajuResultStatus.success,
        result: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: YearlySajuResultStatus.failed,
      ));
    }
  }

  void _onResultClearPressed(
      ClearResultPressed envet, Emitter<YearlySajuResultState> emit) async {
    emit(state.copyWith(status: YearlySajuResultStatus.initial, result: null));
  }
}
