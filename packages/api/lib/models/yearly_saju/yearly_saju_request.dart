import 'package:models/models.dart';

/// [YearlySajuRequest] Yearly Saju request class
class YearlySajuRequest {
  /// [YearlySajuRequest] constructor
  YearlySajuRequest({
    required this.gender,
    required this.birthDateTime,
    required this.birthTimeDisabled,
    required this.datingStatus,
    required this.jobStatus,
    required this.question,
  });

  /// [gender]
  final Gender gender;

  /// [birthDateTime]
  final DateTime birthDateTime;

  /// [birthTimeDisabled]
  final bool birthTimeDisabled;

  /// [datingStatus]
  final DatingStatus datingStatus;

  /// [jobStatus]
  final JobStatus jobStatus;

  /// [question]
  final String question;

  /// [toJson] Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'gender': gender.text,
      'birthDateTime': birthDateTime.toUtc().toIso8601String(),
      'birthTimeDisabled': birthTimeDisabled,
      'datingStatus': datingStatus.text,
      'jobStatus': jobStatus.text,
      'question': question,
    };
  }
}
