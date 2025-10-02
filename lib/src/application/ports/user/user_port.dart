import 'package:traditional_saju/src/application/ports/user/dto/user_dto.dart';
import 'package:traditional_saju/src/domain/user/entity/user.dart';

/// Port for user data operations
abstract interface class UserPort {
  /// Get current user information
  /// Returns [UserInfo] entity if user exists, null otherwise
  Future<UserInfo?> getCurrentUser();

  /// Create new user with provided information
  /// [userDto] - User data transfer object with user information
  /// Returns created [UserInfo] entity
  Future<UserInfo> createUser(CreateUserRequestDto userDto);

  /// Update existing user information
  /// [userDto] - User data transfer object with updated information
  /// Returns updated [UserInfo] entity
  Future<UserInfo> updateUser(UpdateUserRequestDto userDto);

  /// Delete current user
  Future<void> deleteUser();

  /// Check if user exists
  /// Returns true if user exists, false otherwise
  Future<bool> userExists();
}
