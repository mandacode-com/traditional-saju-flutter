/// DTO for updating user nickname
class UpdateNicknameDto {
  const UpdateNicknameDto({
    required this.nickname,
  });

  final String nickname;

  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
    };
  }
}
