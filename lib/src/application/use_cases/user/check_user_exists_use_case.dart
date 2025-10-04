import 'package:traditional_saju/src/application/ports/user/user_port.dart';

/// Use case for checking if user exists
class CheckUserExistsUseCase {
  const CheckUserExistsUseCase({required UserPort userPort})
    : _userPort = userPort;

  final UserPort _userPort;

  /// Check if user exists
  Future<bool> execute() async {
    return _userPort.userExists();
  }
}
