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
}
