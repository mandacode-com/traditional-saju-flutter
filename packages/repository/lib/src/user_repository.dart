import 'package:models/models.dart';
import 'package:storage/storage.dart';

/// [UserRepository] User repository class
class UserRepository {
  /// [UserRepository] Constructor
  UserRepository({
    required UserStorage userMemoryStorage,
    required UserStorage userHiveStorage,
  })  : _userMemoryStorage = userMemoryStorage,
        _userHiveStorage = userHiveStorage;

  final UserStorage _userMemoryStorage;
  final UserStorage _userHiveStorage;

  /// [saveUserToMemory] Save user information
  Future<void> saveUserToMemory(UserInfo userInfo) async {
    await _userMemoryStorage.saveUser(userInfo);
  }

  /// [getMemoryUser] Get user information
  Future<UserInfo?> getMemoryUser() async {
    return _userMemoryStorage.getUser();
  }

  /// [deleteMemoryUser] Delete user information from memory storage
  Future<void> deleteMemoryUser() async {
    await _userMemoryStorage.deleteUser();
  }

  /// [pushUserToHive] Push user information to hive storage
  Future<void> pushUserToHive() async {
    final user = await _userMemoryStorage.getUser();
    if (user != null) {
      await _userHiveStorage.saveUser(user);
    }
  }

  /// [pullUserFromHive] Pull user information from hive storage
  Future<void> pullUserFromHive() async {
    final user = await _userHiveStorage.getUser();
    if (user != null) {
      await _userMemoryStorage.saveUser(user);
    }
  }

  /// [deleteHiveUser] Delete user information from hive storage
  Future<void> deleteHiveUser() async {
    await _userHiveStorage.deleteUser();
  }
}
