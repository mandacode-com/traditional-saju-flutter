import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

final class UserInfoDetailState extends Equatable {
  const UserInfoDetailState({
    FormStatus? formStatus,
    DatingStatus? datingStatus,
    JobStatus? jobStatus,
    bool? permanent,
  }) : _formStatus = formStatus ?? FormStatus.initial,
       _datingStatus = datingStatus ?? DatingStatus.single,
       _jobStatus = jobStatus ?? JobStatus.unemployed,
       _permanent = permanent ?? false;

  final FormStatus _formStatus;
  final DatingStatus _datingStatus;
  final JobStatus _jobStatus;
  final bool _permanent;

  /// [formStatus] getter
  FormStatus get formStatus => _formStatus;

  /// [datingStatus] getter
  DatingStatus get datingStatus => _datingStatus;

  /// [jobStatus] getter
  JobStatus get jobStatus => _jobStatus;

  /// [permanent] getter
  bool get permanent => _permanent;

  /// [copyWith] method
  UserInfoDetailState copyWith({
    FormStatus? formStatus,
    DatingStatus? datingStatus,
    JobStatus? jobStatus,
    bool? permanent,
  }) {
    return UserInfoDetailState(
      formStatus: formStatus ?? _formStatus,
      datingStatus: datingStatus ?? _datingStatus,
      jobStatus: jobStatus ?? _jobStatus,
      permanent: permanent ?? _permanent,
    );
  }

  @override
  List<Object> get props => [
    _formStatus,
    _datingStatus,
    _jobStatus,
    _permanent,
  ];
}
