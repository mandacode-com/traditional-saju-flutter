import 'package:google_sign_in/google_sign_in.dart';

/// Helper class for Google OAuth authentication
class GoogleOAuthHelper {
  GoogleOAuthHelper({
    GoogleSignIn? googleSignIn,
  }) : _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  final GoogleSignIn _googleSignIn;

  /// Sign in with Google and return the access token
  Future<String?> signIn() async {
    try {
      final account = await _googleSignIn.authenticate();

      final authentication = account.authentication;
      return authentication.idToken;
    } catch (e) {
      throw Exception('Google sign in failed: $e');
    }
  }

  /// Sign out from Google
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
