import 'package:equatable/equatable.dart';
import 'package:models/models.dart';
import 'package:saju_mobile_v1/pages/user/base/model/formed_birth.dart';
import 'package:saju_mobile_v1/pages/user/base/model/formed_birth_hour.dart';
import 'package:saju_mobile_v1/pages/user/base/model/formed_birth_min.dart';

final class UserInfoBaseState extends Equatable {
  const UserInfoBaseState({
    FormStatus? formStatus,
    Gender? gender,
    FormedBirthDate? birthDate,
    FormedBirthHour? birthHour,
    FormedBirthMinutes? birthMinutes,
    bool? timeDisabled,
  }) : _formStatus = formStatus ?? FormStatus.initial,
       _gender = gender ?? Gender.male,
       _birthDate = birthDate ?? const FormedBirthDate.pure(),
       _birthHour = birthHour ?? const FormedBirthHour.pure(),
       _birthMinutes = birthMinutes ?? const FormedBirthMinutes.pure(),
       _timeDisabled = timeDisabled ?? false;

  final FormStatus _formStatus;
  final Gender _gender;
  final FormedBirthDate _birthDate;
  final FormedBirthHour _birthHour;
  final FormedBirthMinutes _birthMinutes;
  final bool _timeDisabled;

  /// [formStatus] getter
  FormStatus get formStatus => _formStatus;

  /// [gender] getter
  Gender get gender => _gender;

  /// [birthDate] getter
  FormedBirthDate get birthDate => _birthDate;

  /// [birthHour] getter
  FormedBirthHour get birthHour => _birthHour;

  /// [birthMinutes] getter
  FormedBirthMinutes get birthMinutes => _birthMinutes;

  /// [timeDisabled] getter
  bool get timeDisabled => _timeDisabled;

  /// [copyWith] method
  UserInfoBaseState copyWith({
    FormStatus? formStatus,
    Gender? gender,
    FormedBirthDate? birthDate,
    FormedBirthHour? birthHour,
    FormedBirthMinutes? birthMinutes,
    bool? timeDisabled,
  }) {
    return UserInfoBaseState(
      formStatus: formStatus ?? _formStatus,
      gender: gender ?? _gender,
      birthDate: birthDate ?? _birthDate,
      birthHour: birthHour ?? _birthHour,
      birthMinutes: birthMinutes ?? _birthMinutes,
      timeDisabled: timeDisabled ?? _timeDisabled,
    );
  }

  @override
  List<Object> get props => [
    _formStatus,
    _gender,
    _birthDate,
    _birthHour,
    _birthMinutes,
    _timeDisabled,
  ];
}
