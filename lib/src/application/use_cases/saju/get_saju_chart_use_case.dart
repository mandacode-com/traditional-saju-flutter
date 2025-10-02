import 'package:traditional_saju/src/application/ports/saju/saju_port.dart';
import 'package:traditional_saju/src/domain/saju/entity/chart.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_date.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_hour.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_minutes.dart';

/// Use case for getting Saju chart based on birth information
class GetSajuChartUseCase {
  const GetSajuChartUseCase(this._sajuPort);

  final SajuPort _sajuPort;

  /// Execute Saju chart generation
  /// [birthDate] - Required birth date
  /// [birthHour] - Optional birth hour for more accurate reading
  /// [birthMinutes] - Optional birth minutes for precise calculation
  /// Returns [Chart] entity with Saju analysis
  Future<Chart> execute({
    required BirthDate birthDate,
    BirthHour? birthHour,
    BirthMinutes? birthMinutes,
  }) async {
    return await _sajuPort.getSajuChart(
      birthDate: birthDate,
      birthHour: birthHour,
      birthMinutes: birthMinutes,
    );
  }
}