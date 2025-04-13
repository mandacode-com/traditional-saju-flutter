import 'package:hive_flutter/hive_flutter.dart';
import 'package:saju_mobile_v1/storage/user/model/user_info_hive.dart';
import 'package:saju_mobile_v1/storage/user/user_hive_storage.dart';

/// [HiveInit] is a class that initializes the repository.
class HiveInit {
  /// [encryptionKey] is the encryption key.
  static final encryptionKey = Hive.generateSecureKey();

  /// [init] initializes the repository.
  static Future<void> init(String path) async {
    await Hive.initFlutter(path);

    _RegisterAdapters.register();

    if (!Hive.isBoxOpen(UserHiveStorage().boxName)) {
      await Hive.openBox<UserInfoHive>(
        UserHiveStorage().boxName,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
    }
  }
}

class _RegisterAdapters {
  static void register() {
    Hive
      ..registerAdapter(UserInfoHiveAdapter())
      ..registerAdapter(GenderHiveAdapter())
      ..registerAdapter(DatingStatusHiveAdapter())
      ..registerAdapter(JobStatusHiveAdapter());
  }
}
