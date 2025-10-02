/// DTO for yearly saju request
class YearlySajuRequestDto {
  const YearlySajuRequestDto({
    required this.birthDate,
    required this.birthTime,
    required this.gender,
    this.isLeapMonth,
    this.isBirthTimeUnknown,
    this.question,
  });

  final String birthDate; // YYYY-MM-DD format
  final String birthTime; // HH:mm format
  final String gender; // male, female
  final bool? isLeapMonth;
  final bool? isBirthTimeUnknown;
  final String? question;

  Map<String, dynamic> toJson() {
    return {
      'birthDate': birthDate,
      'birthTime': birthTime,
      'gender': gender,
      if (isLeapMonth != null) 'isLeapMonth': isLeapMonth,
      if (isBirthTimeUnknown != null) 'isBirthTimeUnknown': isBirthTimeUnknown,
      if (question != null) 'question': question,
    };
  }
}
