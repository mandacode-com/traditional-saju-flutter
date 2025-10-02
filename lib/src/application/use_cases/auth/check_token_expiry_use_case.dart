import 'package:traditional_saju/src/application/ports/auth/auth_port.dart';

/// Use case for checking if token is not expired
class CheckTokenExpiryUseCase {
  const CheckTokenExpiryUseCase(this._authPort);

  final AuthPort _authPort;

  /// Execute token expiry check
  /// [accessToken] - Access token to check
  /// Returns true if token is not expired, false otherwise
  Future<bool> execute(String accessToken) async {
    return _authPort.isNotExpired(accessToken);
  }
}
