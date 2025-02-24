import 'package:models/models.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'gender': gender.toString().split('.').last,
      'birthDateTime': birthDateTime.toIso8601String(),
      'datingStatus': datingStatus.toString().split('.').last,
      'jobStatus': jobStatus.toString().split('.').last,
    };
  }
}
