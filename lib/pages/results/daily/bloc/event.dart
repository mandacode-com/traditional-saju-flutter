import 'package:equatable/equatable.dart';

sealed class DailySajuResultEvent extends Equatable {
  const DailySajuResultEvent();

  @override
  List<Object?> get props => [];
}

final class DailyResultSubscriptionRequested extends DailySajuResultEvent {
  const DailyResultSubscriptionRequested();
}

final class ClearDailyResultPressed extends DailySajuResultEvent {
  const ClearDailyResultPressed();
}
