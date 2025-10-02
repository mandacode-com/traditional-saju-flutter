import 'package:google_sign_in/google_sign_in.dart';
import 'package:traditional_saju/src/config/oauth_config.dart';

/// Helper class for Google OAuth authentication
class GoogleOAuthHelper {
  GoogleOAuthHelper({
    required OAuthConfig config,
    GoogleSignIn? googleSignIn,
  }) : _googleSignIn = googleSignIn ??
            GoogleSignIn(
              scopes: ['email', 'profile'],
            );

  final GoogleSignIn _googleSignIn;

  /// Sign in with Google and return the access token
  Future<String?> signIn() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        return null;
      }

      final authentication = await account.authentication;
      return authentication.accessToken;
    } catch (e) {
      throw Exception('Google sign in failed: $e');
    }
  }

  /// Sign out from Google
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }

  /// Check if user is currently signed in
  Future<bool> isSignedIn() async {
    return _googleSignIn.isSignedIn();
  }
}
