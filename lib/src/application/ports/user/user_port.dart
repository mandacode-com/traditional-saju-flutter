import 'package:traditional_saju/src/domain/user/entity/user.dart';

/// Port for user data operations
abstract interface class UserPort {
  /// Get current user information
  /// Returns [UserInfo] entity if user exists, null otherwise
  Future<UserInfo?> getCurrentUser();

  /// Delete current user account
  Future<void> deleteUser();

  /// Update user nickname
  /// Returns updated [UserInfo] entity
  Future<void> updateNickname(String nickname);

  /// Check if user exists
  /// Returns true if user exists, false otherwise
  Future<bool> userExists();
}
