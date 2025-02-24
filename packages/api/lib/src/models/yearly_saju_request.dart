import 'package:models/user/user_info.dart';

/// {@template yearly_saju_request}
/// Yearly Saju request
/// {@endtemplate}
class YearlySajuRequest {
  /// {@macro yearly_saju_request}
  YearlySajuRequest({
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
