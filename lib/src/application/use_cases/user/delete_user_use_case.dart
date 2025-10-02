import 'package:traditional_saju/src/application/ports/user/user_port.dart';

/// Use case for deleting user
class DeleteUserUseCase {
  const DeleteUserUseCase(this._userPort);

  final UserPort _userPort;

  /// Execute user deletion
  Future<void> execute() async {
    await _userPort.deleteUser();
  }
}
