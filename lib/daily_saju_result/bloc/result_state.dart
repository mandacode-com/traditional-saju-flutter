part of 'result_bloc.dart';

enum DailySajuResultStatus { initial, loading, success, failed }

final class DailySajuResultState extends Equatable {
  const DailySajuResultState(
      {this.status = DailySajuResultStatus.initial, this.yearlySajuResult});

  final DailySajuResultStatus status;
  final DailySajuResult? yearlySajuResult;

  DailySajuResultState copyWith({
    DailySajuResultStatus? status,
    DailySajuResult? result,
  }) {
    return DailySajuResultState(
        status: status ?? this.status,
        yearlySajuResult: result ?? yearlySajuResult);
  }

  @override
  List<Object?> get props => [status, yearlySajuResult];
}
