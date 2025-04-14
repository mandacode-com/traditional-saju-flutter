import 'package:models/models.dart';
import 'package:storage/storage.dart';

/// [UserRepository] User repository class
class UserRepository {
  /// [UserRepository] Constructor
  UserRepository({
    required UserStorage userMemoryStorage,
    required UserStorage userHiveStorage,
  }) : _userMemoryStorage = userMemoryStorage,
       _userHiveStorage = userHiveStorage;

  final UserStorage _userMemoryStorage;
  final UserStorage _userHiveStorage;

  /// [saveUser] Save user information
  Future<void> saveUser(UserInfo userInfo) async {
    await _userMemoryStorage.saveUser(userInfo);
  }

  /// [getUser] Get user information
  Future<UserInfo?> getUser() async {
    return _userMemoryStorage.getUser();
  }

  /// [deleteUser] Delete user information from memory storage
  Future<void> deleteUser() async {
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

  /// [updateUser] Update user information
  Future<void> updateUser({
    Gender? gender,
    JobStatus? jobStatus,
    DatingStatus? datingStatus,
    DateTime? birthdate,
    bool? timeDisabled,
    bool? permanent,
  }) async {
    final user = await _userMemoryStorage.getUser() ?? UserInfo();
    final newUser = user.copyWith(
      gender: gender,
      jobStatus: jobStatus,
      datingStatus: datingStatus,
      birthdate: birthdate,
      timeDisabled: timeDisabled,
      permanent: permanent,
    );

    await _userMemoryStorage.saveUser(newUser);
  }

  /// [isUserSaved] Check if user information is saved
  Future<bool> isUserSaved() async {
    final user = await _userHiveStorage.getUser();
    if (user == null) {
      return false;
    }
    return user.permanent;
  }
}
