import 'package:traditional_saju/src/domain/saju/entity/daily_fortune.dart';
import 'package:traditional_saju/src/domain/saju/entity/yearly_fortune.dart';

/// Port for Saju fortune analysis
abstract interface class SajuPort {
  /// Generate daily fortune analysis
  /// Returns [DailyFortune] entity with today's fortune messages
  Future<DailyFortune> getDailyFortune();

  /// Generate yearly fortune analysis
  /// Returns [YearlyFortune] entity with chart and detailed description
  Future<YearlyFortune> getYearlyFortune();
}
