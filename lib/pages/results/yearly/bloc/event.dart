import 'package:equatable/equatable.dart';

sealed class YearlySajuResultEvent extends Equatable {
  const YearlySajuResultEvent();

  @override
  List<Object?> get props => [];
}

final class ResultSubscriptionRequested extends YearlySajuResultEvent {
  const ResultSubscriptionRequested();
}

final class ClearResultPressed extends YearlySajuResultEvent {
  const ClearResultPressed();
}
