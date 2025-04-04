/// [TokenStorage] abstract class
abstract class TokenStorage {
  /// [saveToken] Save token
  Future<void> saveToken(String token);

  /// [getToken] Get token
  Future<String?> getToken();

  /// [deleteToken] Delete token
  Future<void> deleteToken();
}
