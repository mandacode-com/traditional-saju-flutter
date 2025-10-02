import 'package:hive/hive.dart';
import 'package:traditional_saju/src/domain/user/entity/user.dart';
import 'package:traditional_saju/src/infrastructure/storage/models/user_info_hive.dart';

class UserStorageService {
  UserStorageService({required this.boxName});

  final String boxName;
  Box<UserInfoHive>? _box;

  Future<void> init() async {
    _box = await Hive.openBox<UserInfoHive>(boxName);
  }

  Future<void> saveUserInfo(UserInfo userInfo) async {
    final hiveModel = UserInfoHive.fromDomain(userInfo);
    await _box?.put('user_info', hiveModel);
  }

  UserInfo? getUserInfo() {
    final hiveModel = _box?.get('user_info');
    return hiveModel?.toDomain();
  }

  Future<void> deleteUserInfo() async {
    await _box?.delete('user_info');
  }

  Future<void> close() async {
    await _box?.close();
  }
}
