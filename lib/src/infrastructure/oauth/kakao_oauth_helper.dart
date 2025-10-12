import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

/// Helper class for Kakao OAuth authentication
class KakaoOAuthHelper {
  KakaoOAuthHelper({required String nativeAppKey}) {
    KakaoSdk.init(nativeAppKey: nativeAppKey);
  }

  /// Sign in with Kakao and return the access token
  Future<String?> signIn() async {
    try {
      OAuthToken token;

      if (await isKakaoTalkInstalled()) {
        token = await UserApi.instance.loginWithKakaoTalk();
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
      }

      return token.idToken;
    } catch (e) {
      throw Exception('Kakao sign in failed: $e');
    }
  }

  /// Sign out from Kakao
  Future<void> signOut() async {
    await UserApi.instance.logout();
  }

  /// Unlink Kakao account
  Future<void> unlink() async {
    await UserApi.instance.unlink();
  }
}
