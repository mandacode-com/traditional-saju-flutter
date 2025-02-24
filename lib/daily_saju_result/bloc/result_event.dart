part of 'result_bloc.dart';

sealed class DailySajuResultEvent extends Equatable {
  const DailySajuResultEvent();

  @override
  List<Object?> get props => [];
}

final class ResultSubscriptionRequested extends DailySajuResultEvent {
  const ResultSubscriptionRequested();
}

final class ClearResultPressed extends DailySajuResultEvent {
  const ClearResultPressed();
}
