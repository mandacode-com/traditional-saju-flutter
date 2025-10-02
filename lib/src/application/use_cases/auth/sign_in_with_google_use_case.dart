import 'package:traditional_saju/src/application/ports/auth/auth_port.dart';
import 'package:traditional_saju/src/domain/auth/entity/authentication.dart';

/// Use case for signing in with Google
class SignInWithGoogleUseCase {
  const SignInWithGoogleUseCase(this._authPort);

  final AuthPort _authPort;

  /// Execute Google sign in
  /// [googleToken] - Token received from Google sign in
  /// Returns [Authentication] entity containing access and refresh tokens
  Future<Authentication> execute(String googleToken) async {
    return _authPort.signInWithGoogle(googleToken);
  }
}
