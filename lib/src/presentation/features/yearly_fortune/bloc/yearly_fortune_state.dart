import 'package:equatable/equatable.dart';
import 'package:traditional_saju/src/domain/saju/entity/yearly_fortune.dart';

enum YearlyFortuneStatus { initial, loading, success, failure }

final class YearlyFortuneState extends Equatable {
  const YearlyFortuneState({
    this.status = YearlyFortuneStatus.initial,
    this.yearlyFortune,
    this.error,
  });

  final YearlyFortuneStatus status;
  final YearlyFortune? yearlyFortune;
  final String? error;

  YearlyFortuneState copyWith({
    YearlyFortuneStatus? status,
    YearlyFortune? yearlyFortune,
    String? error,
  }) {
    return YearlyFortuneState(
      status: status ?? this.status,
      yearlyFortune: yearlyFortune ?? this.yearlyFortune,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, yearlyFortune, error];
}
