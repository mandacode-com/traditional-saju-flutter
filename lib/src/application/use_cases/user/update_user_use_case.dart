import 'package:traditional_saju/src/application/ports/user/dto/user_dto.dart';
import 'package:traditional_saju/src/application/ports/user/user_port.dart';
import 'package:traditional_saju/src/domain/user/entity/user.dart';

/// Use case for updating user information
class UpdateUserUseCase {
  const UpdateUserUseCase(this._userPort);

  final UserPort _userPort;

  /// Execute user update
  /// [userDto] - User data transfer object with updated information
  /// Returns updated [UserInfo] entity
  Future<UserInfo> execute(UpdateUserRequestDto userDto) async {
    return _userPort.updateUser(userDto);
  }
}
