
import 'package:saju_api/src/apis/apis.dart';

/// {@template saju_api}
/// Saju api library
/// {@endtemplate}
class SajuApi {
  /// {@macro saju_api}
  SajuApi({
    required this.yearlySajuApi,
  });

  /// The [YearlySajuApi] used to make requests.
  final YearlySajuApi yearlySajuApi;
}
