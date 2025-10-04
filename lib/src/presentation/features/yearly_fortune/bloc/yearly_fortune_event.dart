import 'package:equatable/equatable.dart';

sealed class YearlyFortuneEvent extends Equatable {
  const YearlyFortuneEvent();

  @override
  List<Object> get props => [];
}

final class YearlyFortuneLoadRequested extends YearlyFortuneEvent {
  const YearlyFortuneLoadRequested();
}
