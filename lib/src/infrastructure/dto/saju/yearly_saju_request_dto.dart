/// DTO for yearly saju request
class YearlySajuRequestDto {
  const YearlySajuRequestDto({
    required this.birthDate,
    required this.birthTime,
    required this.gender,
    required this.birthDateTime,
    required this.datingStatus,
    required this.jobStatus,
    this.birthTimeDisabled = false,
    this.isLeapMonth,
    this.isBirthTimeUnknown,
    this.question,
  });

  final String birthDate; // YYYY-MM-DD format
  final String birthTime; // HH:mm format
  final String gender; // male, female
  final String birthDateTime; // ISO 8601 format (YYYY-MM-DDTHH:mm:ssZ)
  final String datingStatus; // single, dating, married
  final String jobStatus; // student, working, unemployed
  final bool birthTimeDisabled;
  final bool? isLeapMonth;
  final bool? isBirthTimeUnknown;
  final String? question;

  Map<String, dynamic> toJson() {
    return {
      'birthDate': birthDate,
      'birthTime': birthTime,
      'gender': gender,
      'birthDateTime': birthDateTime,
      'datingStatus': datingStatus,
      'jobStatus': jobStatus,
      'birthTimeDisabled': birthTimeDisabled,
      if (isLeapMonth != null) 'isLeapMonth': isLeapMonth,
      if (isBirthTimeUnknown != null) 'isBirthTimeUnknown': isBirthTimeUnknown,
      if (question != null) 'question': question,
    };
  }
}
