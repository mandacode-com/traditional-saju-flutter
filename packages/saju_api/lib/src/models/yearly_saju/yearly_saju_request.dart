part of 'yearly_saju.dart';

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
  final ApiGenderType gender;

  /// Birth date time
  final DateTime birthDateTime;

  /// Dating status
  final ApiDatingStatus datingStatus;

  /// Job status
  final ApiJobStatus jobStatus;
}
