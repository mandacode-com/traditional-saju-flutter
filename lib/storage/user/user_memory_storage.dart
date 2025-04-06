import 'package:models/models.dart';
import 'package:storage/storage.dart';

/// [UserMemoryStorage] User memory storage
class UserMemoryStorage implements UserStorage {
  UserInfo? _userInfo;

  @override
  Future<void> deleteUser() async {
    _userInfo = null;
  }

  @override
  Future<UserInfo?> getUser() async {
    return _userInfo;
  }

  @override
  Future<void> saveUser(UserInfo userInfo) async {
    _userInfo = userInfo;
  }

  @override
  Future<void> updateUser(UserInfo userInfo) async {
    if (_userInfo != null) {
      _userInfo = userInfo;
    } else {
      throw Exception('User not found');
    }
  }
}
