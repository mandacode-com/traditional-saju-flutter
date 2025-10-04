import 'package:traditional_saju/src/application/ports/user/user_port.dart';

/// Use case for checking if user exists
/// Note: User creation is handled automatically on first login in the new API
class CheckUserExistsUseCase {
  const CheckUserExistsUseCase({required UserPort userPort})
    : _userPort = userPort;

  final UserPort _userPort;

  /// Check if user exists
  /// Returns true if user exists, false otherwise
  Future<bool> execute() async {
    return _userPort.userExists();
  }
}
