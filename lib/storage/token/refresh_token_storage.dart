import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:storage/storage.dart';

class RefreshTokenStorage implements TokenStorage {
  RefreshTokenStorage(FlutterSecureStorage? secureStorage)
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  static const _refreshTokenKey = 'refresh_token';

  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _refreshTokenKey);
  }

  @override
  Future<String?> getToken() async {
    final token = await _secureStorage.read(key: _refreshTokenKey);
    return token;
  }

  @override
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _refreshTokenKey, value: token);
  }
}
