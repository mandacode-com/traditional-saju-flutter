import 'package:hive_flutter/hive_flutter.dart';
import 'package:traditional_saju/src/infrastructure/storage/models/user_info_hive.dart';

class StorageInitializer {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserInfoHiveAdapter());
  }
}
