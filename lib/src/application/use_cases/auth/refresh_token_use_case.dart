import 'package:traditional_saju/src/application/ports/auth/auth_port.dart';
import 'package:traditional_saju/src/domain/auth/entity/authentication.dart';

/// Use case for refreshing authentication tokens
class RefreshTokenUseCase {
  const RefreshTokenUseCase(this._authPort);

  final AuthPort _authPort;

  /// Execute token refresh
  /// [refreshToken] - Current refresh token
  /// Returns new [Authentication] entity with updated tokens
  Future<Authentication> execute(String refreshToken) async {
    return await _authPort.refreshToken(refreshToken);
  }
}