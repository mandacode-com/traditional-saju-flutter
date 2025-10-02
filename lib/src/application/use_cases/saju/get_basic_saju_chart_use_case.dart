import 'package:traditional_saju/src/application/ports/saju/saju_port.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_date.dart';
import 'package:traditional_saju/src/domain/saju/entity/chart.dart';

/// Use case for getting basic Saju chart without time information
class GetBasicSajuChartUseCase {
  const GetBasicSajuChartUseCase({required SajuPort sajuPort})
    : _sajuPort = sajuPort;

  final SajuPort _sajuPort;

  /// Execute basic Saju chart generation
  /// [birthDate] - Required birth date
  /// Returns [Chart] entity with basic Saju analysis (year, month, day only)
  Future<Chart> execute(BirthDate birthDate) async {
    return _sajuPort.getBasicSajuChart(birthDate);
  }
}
