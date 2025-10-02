import 'package:traditional_saju/src/application/ports/user/user_port.dart';

/// Use case for checking if user exists
class CheckUserExistsUseCase {
  const CheckUserExistsUseCase(this._userPort);

  final UserPort _userPort;

  /// Execute user existence check
  /// Returns true if user exists, false otherwise
  Future<bool> execute() async {
    return _userPort.userExists();
  }
}
