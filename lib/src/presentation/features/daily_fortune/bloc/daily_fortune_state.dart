import 'package:equatable/equatable.dart';
import 'package:traditional_saju/src/domain/saju/entity/daily_fortune.dart';

enum DailyFortuneStatus { initial, loading, success, failure }

final class DailyFortuneState extends Equatable {
  const DailyFortuneState({
    this.status = DailyFortuneStatus.initial,
    this.dailyFortune,
    this.error,
  });

  final DailyFortuneStatus status;
  final DailyFortune? dailyFortune;
  final String? error;

  DailyFortuneState copyWith({
    DailyFortuneStatus? status,
    DailyFortune? dailyFortune,
    String? error,
  }) {
    return DailyFortuneState(
      status: status ?? this.status,
      dailyFortune: dailyFortune ?? this.dailyFortune,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, dailyFortune, error];
}
