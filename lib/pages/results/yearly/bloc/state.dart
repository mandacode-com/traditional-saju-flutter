import 'package:api/models/yearly_saju/yearly_saju_response.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

final class YearlySajuResultState extends Equatable {
  const YearlySajuResultState({
    FormStatus? formStatus,
    YearlySajuResponse? yearlySajuResponse,
  })  : _formStatus = formStatus ?? FormStatus.initial,
        _yearlySajuResponse = yearlySajuResponse;

  final FormStatus _formStatus;
  final YearlySajuResponse? _yearlySajuResponse;

  /// [formStatus] getter
  FormStatus get formStatus => _formStatus;

  /// [yearlySajuResponse] getter
  YearlySajuResponse? get yearlySajuResponse => _yearlySajuResponse;

  /// [copyWith] method
  YearlySajuResultState copyWith({
    FormStatus? formStatus,
    YearlySajuResponse? yearlySajuResponse,
  }) {
    return YearlySajuResultState(
      formStatus: formStatus ?? _formStatus,
      yearlySajuResponse: yearlySajuResponse ?? _yearlySajuResponse,
    );
  }

  @override
  List<Object?> get props => [
        _formStatus,
        _yearlySajuResponse,
      ];
}
