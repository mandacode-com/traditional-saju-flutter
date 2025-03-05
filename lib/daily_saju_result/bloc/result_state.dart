part of 'result_bloc.dart';

enum DailySajuResultStatus { initial, loading, success, failed }

final class DailySajuResultState extends Equatable {
  const DailySajuResultState(
      {this.status = DailySajuResultStatus.initial, this.dailySajuResult});

  final DailySajuResultStatus status;
  final DailySajuResponse? dailySajuResult;

  DailySajuResultState copyWith({
    DailySajuResultStatus? status,
    DailySajuResponse? result,
  }) {
    return DailySajuResultState(
        status: status ?? this.status,
        dailySajuResult: result ?? dailySajuResult);
  }

  @override
  List<Object?> get props => [status, dailySajuResult];
}
