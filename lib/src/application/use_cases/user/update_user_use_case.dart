import 'package:traditional_saju/src/application/ports/user/user_port.dart';

/// Use case for updating user nickname
class UpdateUserNicknameUseCase {
  const UpdateUserNicknameUseCase(this._userPort);

  final UserPort _userPort;

  /// Execute user nickname update
  /// [nickname] - New nickname for the user
  Future<void> execute(String nickname) async {
    return _userPort.updateNickname(nickname);
  }
}
