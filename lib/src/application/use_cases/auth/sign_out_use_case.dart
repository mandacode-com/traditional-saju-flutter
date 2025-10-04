import 'package:traditional_saju/src/application/ports/auth/auth_port.dart';

/// Use case for signing out
class SignOutUseCase {
  const SignOutUseCase({required AuthPort authPort}) : _authPort = authPort;

  final AuthPort _authPort;

  /// Execute sign out
  Future<void> execute() async {
    return _authPort.signOut();
  }
}
