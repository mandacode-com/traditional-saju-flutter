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
      if (response.statusCode != 200) {
        throw Exception('Failed to verify token');
      }
      if (response.data == null) {
        throw Exception('Failed to verify token');
      }
      if (response.data!.uuid.isEmpty) {
        throw Exception('Failed to verify token');
      }
      return true;
    } catch (e) {
      await _accessTokenStorage.deleteToken();
      return false;
    }
  }

  /// [refreshToken] method
  Future<void> refreshToken() async {
    final refreshToken = await _refreshTokenStorage.getToken();
    if (refreshToken == null) {
      throw Exception('Refresh token is empty');
    }
    final response = await _authApi.refreshToken(refreshToken);
    if (response.statusCode != 200) {
      throw Exception('Failed to refresh token');
    }
    if (response.data == null) {
      throw Exception('Failed to refresh token');
    }
    if (response.data!.accessToken.isEmpty ||
        response.data!.refreshToken.isEmpty) {
      throw Exception('Failed to refresh token');
    }
    await Future.wait([
      _accessTokenStorage.saveToken(response.data!.accessToken),
      _refreshTokenStorage.saveToken(response.data!.refreshToken),
    ]);
  }

  /// [signInWithGoogle] method
  Future<bool> signInWithGoogle() async {
    try {
      final response = await _authApi.signInWithGoogle();
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to sign in with Google');
      }
      if (response.data == null) {
        throw Exception('Failed to sign in with Google');
      }
      if (response.data!.accessToken.isEmpty ||
          response.data!.refreshToken.isEmpty) {
        throw Exception('Failed to sign in with Google');
      }
      await Future.wait([
        _accessTokenStorage.saveToken(response.data!.accessToken),
        _refreshTokenStorage.saveToken(response.data!.refreshToken),
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

  /// [signInWithKakao] method
  Future<bool> signInWithKakao() async {
    try {
      final response = await _authApi.signInWithKakao();
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to sign in with Kakao');
      }
      if (response.data == null) {
        throw Exception('Failed to sign in with Kakao');
      }
      if (response.data!.accessToken.isEmpty ||
          response.data!.refreshToken.isEmpty) {
        throw Exception('Failed to sign in with Kakao');
      }
      await Future.wait([
        _accessTokenStorage.saveToken(response.data!.accessToken),
        _refreshTokenStorage.saveToken(response.data!.refreshToken),
      ]);
      return true;
    } catch (e) {
      print('Error: $e');
      await Future.wait([
        _accessTokenStorage.deleteToken(),
        _refreshTokenStorage.deleteToken(),
      ]);
      return false;
    }
  }

  /// [logout] method
  Future<void> logout() async {
    await Future.wait([
      _accessTokenStorage.deleteToken(),
      _refreshTokenStorage.deleteToken(),
    ]);
  }
}
