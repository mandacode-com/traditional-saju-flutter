import 'package:api/models/daily_saju/daily_saju_response.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

final class DailySajuResultState extends Equatable {
  const DailySajuResultState({
    FormStatus? formStatus,
    DailySajuResponse? dailySajuResponse,
  }) : _formStatus = formStatus ?? FormStatus.initial,
       _dailySajuResponse = dailySajuResponse;

  final FormStatus _formStatus;
  final DailySajuResponse? _dailySajuResponse;

  /// [formStatus] getter
  FormStatus get formStatus => _formStatus;

  /// [dailySajuResponse] getter
  DailySajuResponse? get dailySajuResponse => _dailySajuResponse;

  /// [copyWith] method
  DailySajuResultState copyWith({
    FormStatus? formStatus,
    DailySajuResponse? dailySajuResponse,
  }) {
    return DailySajuResultState(
      formStatus: formStatus ?? _formStatus,
      dailySajuResponse: dailySajuResponse ?? _dailySajuResponse,
    );
  }

  @override
  List<Object?> get props => [_formStatus, _dailySajuResponse];
}
