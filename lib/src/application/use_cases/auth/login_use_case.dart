import 'package:traditional_saju/src/application/ports/auth/auth_port.dart';
import 'package:traditional_saju/src/domain/auth/entity/authentication.dart';

/// Use case for login
class LoginUseCase {
  const LoginUseCase({required AuthPort authPort}) : _authPort = authPort;

  final AuthPort _authPort;

  /// Execute Google sign in
  /// [provider] - Authentication provider (e.g., 'google', 'kakao')
  /// [idToken] - Token received from the provider sign in
  /// Returns [Authentication] entity containing access and refresh tokens
  Future<Authentication> execute(String provider, String idToken) async {
    return _authPort.login(provider, idToken);
  }
}
