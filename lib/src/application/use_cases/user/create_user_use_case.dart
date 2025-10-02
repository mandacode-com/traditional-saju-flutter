import 'package:traditional_saju/src/application/ports/user/dto/user_dto.dart';
import 'package:traditional_saju/src/application/ports/user/user_port.dart';
import 'package:traditional_saju/src/domain/user/entity/user.dart';

/// Use case for creating new user
class CreateUserUseCase {
  const CreateUserUseCase(this._userPort);

  final UserPort _userPort;

  /// Execute user creation
  /// [userDto] - User data transfer object with user information
  /// Returns created [UserInfo] entity
  Future<UserInfo> execute(CreateUserRequestDto userDto) async {
    return await _userPort.createUser(userDto);
  }
}