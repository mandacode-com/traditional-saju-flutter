import 'package:equatable/equatable.dart';

sealed class DailyFortuneEvent extends Equatable {
  const DailyFortuneEvent();

  @override
  List<Object> get props => [];
}

final class DailyFortuneLoadRequested extends DailyFortuneEvent {
  const DailyFortuneLoadRequested();
}
