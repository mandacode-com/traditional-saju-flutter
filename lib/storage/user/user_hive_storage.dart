import 'package:hive_flutter/hive_flutter.dart';
import 'package:models/models.dart';
import 'package:saju_mobile_v1/storage/user/model/user_info_hive.dart';
import 'package:storage/storage.dart';

class UserHiveStorage implements UserStorage {
  static const String _boxName = 'userBox';
  static const String _userKey = 'user_info';

  String get boxName => _boxName;

  Future<void> init() async {
    registerAdapter();

    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<UserInfoHive>(_boxName);
    }
  }

  void registerAdapter() {
    Hive
      ..registerAdapter(UserInfoHiveAdapter())
      ..registerAdapter(GenderHiveAdapter())
      ..registerAdapter(DatingStatusHiveAdapter())
      ..registerAdapter(JobStatusHiveAdapter());
  }

  @override
  Future<void> deleteUser() async {
    final userBox = Hive.box<UserInfoHive>(_boxName);
    await userBox.delete(_userKey);
  }

  @override
  Future<UserInfo?> getUser() async {
    final userBox = Hive.box<UserInfoHive>(_boxName);
    final user = userBox.get(_userKey);
    if (user == null) {
      return null;
    }
    return user.toRaw();
  }

  @override
  Future<void> saveUser(UserInfo userInfo) async {
    final userBox = Hive.box<UserInfoHive>(_boxName);
    final userHiveModel = UserInfoHive.fromRaw(userInfo);
    await userBox.put(_userKey, userHiveModel);
  }

  @override
  Future<void> updateUser(UserInfo userInfo) async {
    final userBox = Hive.box<UserInfoHive>(_boxName);
    final userHiveModel = UserInfoHive.fromRaw(userInfo);
    await userBox.put(_userKey, userHiveModel);
  }
}
