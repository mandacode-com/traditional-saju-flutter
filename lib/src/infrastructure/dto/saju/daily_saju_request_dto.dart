/// DTO for daily saju request
class DailySajuRequestDto {
  const DailySajuRequestDto({
    required this.birthDateTime,
    required this.gender,
    required this.datingStatus,
    required this.jobStatus,
  });

  final String birthDateTime; // ISO 8601 format
  final String gender; // male, female
  final String datingStatus; // single, dating, married
  final String jobStatus; // employed, unemployed, student, self-employed

  Map<String, dynamic> toJson() {
    return {
      'birthDateTime': birthDateTime,
      'gender': gender,
      'datingStatus': datingStatus,
      'jobStatus': jobStatus,
    };
  }
}
