import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/user/user_info.dart';
import 'package:repository/repository.dart';
import 'package:saju/base_info/form_status.dart';
import 'package:equatable/equatable.dart';

part 'spec_member_info_state.dart';

class YearlySajuMemberDetailCubit
    extends Cubit<YearlySajuMemberDetailState> {
  YearlySajuMemberDetailCubit({
    required this.userInfoRepository,
  }) : super(const YearlySajuMemberDetailState()) {
    _init();
  }

  final UserInfoRepository userInfoRepository;

  void _init() async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      final userInfo = await userInfoRepository.getUserInfo();
      final datingStatus = userInfo.datingType;
      final jobStatus = userInfo.jobStatus;
      final saveInfo = userInfo.saveInfo;
      emit(
        state.copyWith(
          status: FormStatus.success,
          datingStatus: datingStatus,
          jobStatus: jobStatus,
          saveInfo: saveInfo,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FormStatus.failure));
    }
  }

  void changeDatingStatus(DatingStatus datingStatus) {
    userInfoRepository.updateUserInfoWith(datingStatus: datingStatus);
    emit(
      state.copyWith(
        datingStatus: datingStatus,
      ),
    );
  }

  void changeJobStatus(JobStatus jobStatus) {
    userInfoRepository.updateUserInfoWith(jobStatus: jobStatus);
    emit(
      state.copyWith(
        jobStatus: jobStatus,
      ),
    );
  }

  void changeSaveInfo(bool saveInfo) {
    userInfoRepository.updateUserInfoWith(saveInfo: saveInfo);
    emit(
      state.copyWith(
        saveInfo: saveInfo,
      ),
    );
  }
}
