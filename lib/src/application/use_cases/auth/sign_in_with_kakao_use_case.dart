import 'package:traditional_saju/src/application/ports/auth/auth_port.dart';
import 'package:traditional_saju/src/domain/auth/entity/authentication.dart';

/// Use case for signing in with Kakao
class SignInWithKakaoUseCase {
  const SignInWithKakaoUseCase({required AuthPort authPort})
    : _authPort = authPort;

  final AuthPort _authPort;

  /// Execute Kakao sign in
  /// [kakaoToken] - Token received from Kakao sign in
  /// Returns [Authentication] entity containing access and refresh tokens
  Future<Authentication> execute(String kakaoToken) async {
    return _authPort.signInWithKakao(kakaoToken);
  }
}
