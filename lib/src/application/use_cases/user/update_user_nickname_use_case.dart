import 'package:traditional_saju/src/application/ports/user/user_port.dart';

/// Use case for updating user nickname
class UpdateUserNicknameUseCase {
  const UpdateUserNicknameUseCase({required UserPort userPort})
    : _userPort = userPort;

  final UserPort _userPort;

  /// Update user nickname
  Future<void> execute(String nickname) async {
    return _userPort.updateNickname(nickname);
  }
}
