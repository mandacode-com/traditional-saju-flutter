import 'package:hive_flutter/hive_flutter.dart';
import 'package:models/models.dart';
import 'package:saju_mobile_v1/storage/user/user_info_hive.dart';
import 'package:storage/storage.dart';

class UserHiveStorage implements UserStorage {
  static const String _boxName = 'userBox';
  static const String _userKey = 'user_info';

  late final Box<UserHiveModel> _userBox;

  String get boxName => _boxName;

  @override
  Future<void> deleteUser() async {
    await _userBox.delete(_userKey);
  }

  @override
  Future<UserInfo?> getUser() async {
    final user = _userBox.get(_userKey);
    if (user == null) {
      return null;
    }
    return user.toUserInfo();
  }

  @override
  Future<void> saveUser(UserInfo userInfo) async {
    final userHiveModel = UserHiveModel.fromUserInfo(userInfo);
    await _userBox.put(_userKey, userHiveModel);
  }

  @override
  Future<void> updateUser(UserInfo userInfo) async {
    final userHiveModel = UserHiveModel.fromUserInfo(userInfo);
    await _userBox.put(_userKey, userHiveModel);
  }
}
