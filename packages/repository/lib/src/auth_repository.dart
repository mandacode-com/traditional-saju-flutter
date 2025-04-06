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

  /// [signInWithGoogle] method
  Future<void> signInWithGoogle() async {
    final response = await _authApi.signInWithGoogle();
    if (response.statusCode == 200) {
      final authResponse = response.data;
      if (authResponse != null) {
        await _accessTokenStorage.saveToken(authResponse.accessToken);
        await _refreshTokenStorage.saveToken(authResponse.refreshToken);
      }
    } else {
      throw Exception('Failed to sign in with Google');
    }
  }
}
