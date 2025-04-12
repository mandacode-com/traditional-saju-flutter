import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

sealed class UserInfoDetailEvent extends Equatable {
  const UserInfoDetailEvent();

  @override
  List<Object> get props => [];
}

final class UserInfoDetailSubscriptionRequested extends UserInfoDetailEvent {
  const UserInfoDetailSubscriptionRequested();

  @override
  List<Object> get props => [];
}

final class UserInfoDetailDatingChanged extends UserInfoDetailEvent {
  const UserInfoDetailDatingChanged(this.datingStatus);

  final DatingStatus datingStatus;

  @override
  List<Object> get props => [datingStatus];
}

final class UserInfoDetailJobChanged extends UserInfoDetailEvent {
  const UserInfoDetailJobChanged(this.jobStatus);

  final JobStatus jobStatus;

  @override
  List<Object> get props => [jobStatus];
}

final class UserInfoDetailPermanentChanged extends UserInfoDetailEvent {
  const UserInfoDetailPermanentChanged({required this.permanent});

  final bool permanent;

  @override
  List<Object> get props => [permanent];
}

final class UserInfoDetailFormSubmitted extends UserInfoDetailEvent {
  const UserInfoDetailFormSubmitted();

  @override
  List<Object> get props => [];
}
