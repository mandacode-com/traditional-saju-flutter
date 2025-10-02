import 'package:traditional_saju/src/application/ports/saju/saju_port.dart';
import 'package:traditional_saju/src/domain/saju/entity/chart.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_date.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_hour.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_minutes.dart';

/// Use case for getting complete Saju chart with precise time
class GetCompleteSajuChartUseCase {
  const GetCompleteSajuChartUseCase(this._sajuPort);

  final SajuPort _sajuPort;

  /// Execute complete Saju chart generation
  /// [birthDate] - Required birth date
  /// [birthHour] - Required birth hour
  /// [birthMinutes] - Required birth minutes
  /// Returns [Chart] entity with complete Saju analysis including hour pillar
  Future<Chart> execute({
    required BirthDate birthDate,
    required BirthHour birthHour,
    required BirthMinutes birthMinutes,
  }) async {
    return await _sajuPort.getCompleteSajuChart(
      birthDate: birthDate,
      birthHour: birthHour,
      birthMinutes: birthMinutes,
    );
  }
}