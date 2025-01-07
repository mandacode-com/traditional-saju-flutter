part of 'result_bloc.dart';

sealed class NewYearSajuResultEvent extends Equatable {
  const NewYearSajuResultEvent();

  @override
  List<Object?> get props => [];
}

final class ResultSubscriptionRequested extends NewYearSajuResultEvent {
  const ResultSubscriptionRequested();
}

final class ClearResultPressed extends NewYearSajuResultEvent {
  const ClearResultPressed();
}
