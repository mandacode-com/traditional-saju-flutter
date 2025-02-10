part of 'result_bloc.dart';

enum YearlySajuResultStatus { initial, loading, success, failed }

final class YearlySajuResultState extends Equatable {
  const YearlySajuResultState(
      {this.status = YearlySajuResultStatus.initial, this.result});

  final YearlySajuResultStatus status;
  final Result? result;

  YearlySajuResultState copyWith({
    YearlySajuResultStatus? status,
    Result? result,
  }) {
    return YearlySajuResultState(
        status: status ?? this.status, result: result ?? this.result);
  }

  @override
  List<Object?> get props => [status, result];
}
