import 'package:traditional_saju/src/application/ports/user/user_port.dart';
import 'package:traditional_saju/src/domain/user/entity/user.dart';
import 'package:traditional_saju/src/infrastructure/client/api_client.dart';

/// Implementation of UserPort using REST API
class UserAdapter implements UserPort {
  const UserAdapter({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<UserInfo?> getCurrentUser() async {
    // TODO(traditional_saju): Implement GET /user endpoint
    throw UnimplementedError('getCurrentUser requires API endpoint');
  }

  @override
  Future<bool> userExists() async {
    // Can be implemented by trying to fetch current user
    try {
      final user = await getCurrentUser();
      return user != null;
    } on Exception {
      return false;
    }
  }

  @override
  Future<void> deleteUser() async {
    await _apiClient.dio.delete<void>('/user');
    // Clear tokens after deletion
    await _apiClient.clearTokens();
  }
}
