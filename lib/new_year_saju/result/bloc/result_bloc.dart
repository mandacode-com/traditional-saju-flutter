import 'package:byul_mobile/new_year_saju/result/model/result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_year_saju_repository/new_year_saju_repository.dart';

part 'result_event.dart';
part 'result_state.dart';

class NewYearSajuResultBloc
    extends Bloc<NewYearSajuResultEvent, NewYearSajuResultState> {
  NewYearSajuResultBloc({
    required NewYearSajuRepository newYearSajuRepository,
  })  : _newYearSajuRepository = newYearSajuRepository,
        super(const NewYearSajuResultState()) {
    on<ResultSubscriptionRequested>(_onResultSubscriptionRequested);
    on<ClearResultPressed>(_onResultClearPressed);
  }

  final NewYearSajuRepository _newYearSajuRepository;

  void _onResultSubscriptionRequested(ResultSubscriptionRequested event,
      Emitter<NewYearSajuResultState> emit) async {
    Result result = Result(message: "");

    final bool submitResult = await _newYearSajuRepository.submitSajuForm();

    if (submitResult) {
      result = Result(message: "success");
    } else {
      result = Result(message: "failure");
    }

    emit(state.copyWith(
      status: submitResult
          ? NewYearSajuResultStatus.success
          : NewYearSajuResultStatus.failed,
      result: result,
    ));
  }

  void _onResultClearPressed(
      ClearResultPressed envet, Emitter<NewYearSajuResultState> emit) async {
    final result = Result(message: "");
    emit(state.copyWith(result: result));
  }
}
