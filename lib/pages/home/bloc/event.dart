
import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeSubscriptionRequested extends HomeEvent {
  const HomeSubscriptionRequested();

  @override
  List<Object> get props => [];
}

final class HomeLoginRequested extends HomeEvent {
  const HomeLoginRequested();

  @override
  List<Object> get props => [];
}

final class HomeLogoutRequested extends HomeEvent {
  const HomeLogoutRequested();

  @override
  List<Object> get props => [];
}
