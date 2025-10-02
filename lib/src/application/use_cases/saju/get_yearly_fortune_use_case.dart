import 'package:traditional_saju/src/application/ports/saju/saju_port.dart';
import 'package:traditional_saju/src/domain/saju/entity/yearly_fortune.dart';

/// Use case for getting yearly fortune analysis
class GetYearlyFortuneUseCase {
  const GetYearlyFortuneUseCase(this._sajuPort);

  final SajuPort _sajuPort;

  /// Execute yearly fortune analysis
  /// Returns [YearlyFortune] entity with chart and detailed description
  Future<YearlyFortune> execute() async {
    return _sajuPort.getYearlyFortune();
  }
}
