import 'package:traditional_saju/src/domain/user/value/dating_status.dart';

extension DatingStatusExt on DatingStatus {
  String get textKor {
    switch (this) {
      case DatingStatus.single:
        return '솔로';
      case DatingStatus.dating:
        return '연애중';
      case DatingStatus.married:
        return '기혼';
    }
  }
}
