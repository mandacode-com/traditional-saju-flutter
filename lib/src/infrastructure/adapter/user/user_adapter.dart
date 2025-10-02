import 'package:traditional_saju/src/application/ports/user/user_port.dart';
import 'package:traditional_saju/src/domain/user/entity/user.dart';
import 'package:traditional_saju/src/infrastructure/client/api_client.dart';
import 'package:traditional_saju/src/infrastructure/dto/user/update_nickname_dto.dart';

/// Implementation of UserPort using REST API
class UserAdapter implements UserPort {
  const UserAdapter({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<UserInfo?> getCurrentUser() async {
    // TODO: Implement user fetch endpoint
    // The API spec doesn't show a GET /user endpoint
    // Need to clarify how to get current user info
    throw UnimplementedError('getCurrentUser requires API endpoint');
  }

  @override
  Future<bool> userExists() async {
    // Can be implemented by trying to fetch current user
    try {
      final user = await getCurrentUser();
      return user != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> deleteUser() async {
    await _apiClient.dio.delete<void>('/user');
    // Clear tokens after deletion
    await _apiClient.clearTokens();
  }

  @override
  Future<void> updateNickname(String nickname) async {
    final dto = UpdateNicknameDto(nickname: nickname);
    await _apiClient.dio.patch<void>(
      '/user/nickname',
      data: dto.toJson(),
    );
  }
}
