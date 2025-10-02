import 'package:traditional_saju/src/domain/saju/entity/birth_date.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_hour.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_minutes.dart';
import 'package:traditional_saju/src/domain/saju/entity/chart.dart';
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

  /// Generate Saju chart based on birth information
  /// [birthDate] - Required birth date
  /// [birthHour] - Optional birth hour for more accurate reading
  /// [birthMinutes] - Optional birth minutes for precise calculation
  /// Returns [Chart] entity with complete Saju analysis
  Future<Chart> getSajuChart({
    required BirthDate birthDate,
    BirthHour? birthHour,
    BirthMinutes? birthMinutes,
  });

  /// Generate basic Saju chart without time information
  /// [birthDate] - Required birth date
  /// Returns [Chart] entity with basic Saju analysis (year, month, day only)
  Future<Chart> getBasicSajuChart(BirthDate birthDate);

  /// Generate complete Saju chart with precise time
  /// [birthDate] - Required birth date
  /// [birthHour] - Required birth hour
  /// [birthMinutes] - Required birth minutes
  /// Returns [Chart] entity with complete Saju analysis including hour pillar
  Future<Chart> getCompleteSajuChart({
    required BirthDate birthDate,
    required BirthHour birthHour,
    required BirthMinutes birthMinutes,
  });
}
