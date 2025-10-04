import 'package:traditional_saju/src/application/ports/saju/saju_port.dart';
import 'package:traditional_saju/src/domain/saju/entity/daily_fortune.dart';

/// Use case for getting daily fortune analysis
class GetDailyFortuneUseCase {
  const GetDailyFortuneUseCase({required SajuPort sajuPort})
    : _sajuPort = sajuPort;

  final SajuPort _sajuPort;

  /// Execute daily fortune analysis
  /// Returns [DailyFortune] entity with today's fortune messages
  Future<DailyFortune> execute() async {
    return _sajuPort.getDailyFortune();
  }
}
