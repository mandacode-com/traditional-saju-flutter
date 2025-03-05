part of 'spec_member_info_cubit.dart';

class UserDetailState extends Equatable {
  const UserDetailState({
    this.status = FormStatus.initial,
    this.datingStatus = DatingStatus.single,
    this.jobStatus = JobStatus.student,
    this.saveInfo = false,
  });

  final FormStatus status;
  final DatingStatus datingStatus;
  final JobStatus jobStatus;
  final bool saveInfo;

  UserDetailState copyWith({
    FormStatus? status,
    DatingStatus? datingStatus,
    JobStatus? jobStatus,
    bool? saveInfo,
  }) {
    return UserDetailState(
      status: status ?? this.status,
      datingStatus: datingStatus ?? this.datingStatus,
      jobStatus: jobStatus ?? this.jobStatus,
      saveInfo: saveInfo ?? this.saveInfo,
    );
  }

  @override
  List<Object> get props => [status, datingStatus, jobStatus, saveInfo];
}
