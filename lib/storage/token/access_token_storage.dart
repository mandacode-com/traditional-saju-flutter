import 'package:storage/storage.dart';

class AccessTokenStorage implements TokenStorage {
  String? _accessToken;

  @override
  Future<void> deleteToken() async {
    _accessToken = null;
  }

  @override
  Future<String?> getToken() async {
    return _accessToken;
  }

  @override
  Future<void> saveToken(String token) async {
    _accessToken = token;
  }
}
