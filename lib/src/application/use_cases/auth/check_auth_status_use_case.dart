import 'package:traditional_saju/src/application/ports/auth/auth_port.dart';

/// Use case for checking authentication status
class CheckAuthStatusUseCase {
  const CheckAuthStatusUseCase({required AuthPort authPort})
    : _authPort = authPort;

  final AuthPort _authPort;

  /// Check if user is authenticated
  Future<bool> execute() async {
    return _authPort.isAuthenticated();
  }
}
