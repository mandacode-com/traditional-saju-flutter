import 'package:equatable/equatable.dart';

sealed class YearlySajuResultEvent extends Equatable {
  const YearlySajuResultEvent();

  @override
  List<Object?> get props => [];
}

final class YearlyResultSubscriptionRequested extends YearlySajuResultEvent {
  const YearlyResultSubscriptionRequested();
}

final class ClearYearlyResultPressed extends YearlySajuResultEvent {
  const ClearYearlyResultPressed();
}
