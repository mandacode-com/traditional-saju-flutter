import 'package:hive_flutter/hive_flutter.dart';
import 'package:saju_mobile_v1/storage/user/user_hive_storage.dart';

/// [HiveInit] is a class that initializes the repository.
class HiveInit {
  /// [init] initializes the repository.
  static Future<void> init(String path) async {
    await Hive.initFlutter(path);
    await UserHiveStorage().init();
  }
}
