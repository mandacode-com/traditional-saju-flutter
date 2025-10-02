import 'package:traditional_saju/src/application/ports/auth/auth_port.dart';

/// Use case for verifying authentication token
class VerifyTokenUseCase {
  const VerifyTokenUseCase(this._authPort);

  final AuthPort _authPort;

  /// Execute token verification
  /// [accessToken] - Access token to verify
  /// Returns true if token is valid, false otherwise
  Future<bool> execute(String accessToken) async {
    return await _authPort.verifyToken(accessToken);
  }
}