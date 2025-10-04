import 'package:traditional_saju/src/application/ports/auth/auth_port.dart';

/// Use case for user logout
class LogoutUseCase {
  const LogoutUseCase({required AuthPort authPort}) : _authPort = authPort;

  final AuthPort _authPort;

  /// Execute logout
  /// [accessToken] - Current access token
  Future<void> execute(String accessToken) async {
    await _authPort.logout(accessToken);
  }
}
