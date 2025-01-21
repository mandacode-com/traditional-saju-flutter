part of 'result_bloc.dart';

enum NewYearSajuResultStatus { initial, loading, success, failed }

final class NewYearSajuResultState extends Equatable {
  const NewYearSajuResultState(
      {this.status = NewYearSajuResultStatus.initial, this.result});

  final NewYearSajuResultStatus status;
  final Result? result;

  NewYearSajuResultState copyWith({
    NewYearSajuResultStatus? status,
    Result? result,
  }) {
    return NewYearSajuResultState(
        status: status ?? this.status, result: result ?? this.result);
  }

  @override
  List<Object?> get props => [status, result];
}
