import 'package:traditional_saju/src/application/ports/user/user_port.dart';
import 'package:traditional_saju/src/domain/user/entity/user.dart';

/// Use case for getting current user information
class GetCurrentUserUseCase {
  const GetCurrentUserUseCase(this._userPort);

  final UserPort _userPort;

  /// Execute get current user
  /// Returns [UserInfo] entity if user exists, null otherwise
  Future<UserInfo?> execute() async {
    return _userPort.getCurrentUser();
  }
}
