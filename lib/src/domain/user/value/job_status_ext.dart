import 'package:traditional_saju/src/domain/user/value/job_status.dart';

extension JobStatusExt on JobStatus {
  String get textKor {
    switch (this) {
      case JobStatus.student:
        return '학생';
      case JobStatus.unemployed:
        return '구직중';
      case JobStatus.employed:
        return '재직중';
    }
  }
}
