import 'package:models/models.dart';

/// [UserStorage] User storage interface
abstract class UserStorage {
  /// [saveUser] Save user information
  Future<void> saveUser(UserInfo userInfo);

  /// [getUser] Get user information
  Future<UserInfo?> getUser();

  /// [deleteUser] Delete user information
  Future<void> deleteUser();

  /// [updateUser] Update user information
  Future<void> updateUser(UserInfo userInfo);
}
