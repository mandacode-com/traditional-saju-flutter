/// DTO for yearly saju request
class YearlySajuRequestDto {
  const YearlySajuRequestDto({
    required this.gender,
    required this.birthDateTime,
    required this.datingStatus,
    required this.jobStatus,
    this.birthTimeDisabled = false,
    this.question,
  });

  final String gender; // male, female
  final String birthDateTime; // ISO 8601 format (YYYY-MM-DDTHH:mm:ssZ)
  final String datingStatus; // single, dating, married
  final String jobStatus; // student, working, unemployed
  final bool birthTimeDisabled;
  final String? question;

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'birthDateTime': birthDateTime,
      'datingStatus': datingStatus,
      'jobStatus': jobStatus,
      'birthTimeDisabled': birthTimeDisabled,
      if (question != null) 'question': question,
    };
  }
}
