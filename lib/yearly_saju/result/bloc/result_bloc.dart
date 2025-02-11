import 'package:saju/yearly_saju/result/model/result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    Result result = Result(message: "");

    final bool submitResult = await _yearlySajuRepository.submitSajuForm();

    if (submitResult) {
      result = Result(message: "success");
    } else {
      result = Result(message: "failure");
    }

    emit(state.copyWith(
      status: submitResult
          ? YearlySajuResultStatus.success
          : YearlySajuResultStatus.failed,
      result: result,
    ));
  }

  void _onResultClearPressed(
      ClearResultPressed envet, Emitter<YearlySajuResultState> emit) async {
    final result = Result(message: "");
    emit(state.copyWith(result: result));
  }
}
