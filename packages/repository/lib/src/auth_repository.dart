import 'package:api/api.dart';
import 'package:storage/storage.dart';

/// [AuthRepository]
class AuthRepository {
  /// [AuthRepository] constructor
  AuthRepository({
    required AuthApi authApi,
    required TokenStorage accessTokenStorage,
    required TokenStorage refreshTokenStorage,
  })  : _authApi = authApi,
        _accessTokenStorage = accessTokenStorage,
        _refreshTokenStorage = refreshTokenStorage;

  final AuthApi _authApi;
  final TokenStorage _accessTokenStorage;
  final TokenStorage _refreshTokenStorage;

  /// [verifyToken] method
  Future<bool> verifyToken() async {
    try {
      final accessToken = await _accessTokenStorage.getToken();
      if (accessToken == null) {
        throw Exception('Access token is empty');
      }
      final response = await _authApi.verifyToken(accessToken);
      if (response.accessToken.isEmpty || response.refreshToken.isEmpty) {
        throw Exception('Failed to verify token');
      }
      await Future.wait([
        _accessTokenStorage.saveToken(response.accessToken),
        _refreshTokenStorage.saveToken(response.refreshToken),
      ]);
      return true;
    } catch (e) {
      await _accessTokenStorage.deleteToken();
      return false;
    }
  }

  /// [refreshToken] method
  Future<void> refreshToken(String refreshToken) async {
    final response = await _authApi.refreshToken(refreshToken);
    if (response.accessToken.isEmpty || response.refreshToken.isEmpty) {
      throw Exception('Failed to refresh token');
    }
    await Future.wait([
      _accessTokenStorage.saveToken(response.accessToken),
      _refreshTokenStorage.saveToken(response.refreshToken),
    ]);
  }

  /// [signInWithGoogle] method
  Future<bool> signInWithGoogle() async {
    try {
      final response = await _authApi.signInWithGoogle();
      if (response.accessToken.isEmpty || response.refreshToken.isEmpty) {
        throw Exception('Failed to sign in with Google');
      }
      await Future.wait([
        _accessTokenStorage.saveToken(response.accessToken),
        _refreshTokenStorage.saveToken(response.refreshToken),
      ]);
      return true;
    } catch (e) {
      await Future.wait([
        _accessTokenStorage.deleteToken(),
        _refreshTokenStorage.deleteToken(),
      ]);
      return false;
    }
  }
}
