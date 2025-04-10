import 'package:models/models.dart';

/// [DailySajuRequest] Daily Saju request model
class DailySajuRequest {
  /// Constructor
  DailySajuRequest({
    required this.gender,
    required this.birthDateTime,
    required this.datingStatus,
    required this.jobStatus,
  });

  /// Gender
  final Gender gender;

  /// Birth date time
  final DateTime birthDateTime;

  /// Dating status
  final DatingStatus datingStatus;

  /// Job status
  final JobStatus jobStatus;

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'gender': gender.text,
      'birthDateTime': birthDateTime.toIso8601String(),
      'datingStatus': datingStatus.text,
      'jobStatus': jobStatus.text,
    };
  }
}
