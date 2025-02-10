import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saju_local_storage/saju_local_storage.dart';
import 'package:byul_mobile/yearly_saju/form_status.dart';
import 'package:equatable/equatable.dart';
import 'package:yearly_saju_repository/yearly_saju_repository.dart';

part 'spec_member_info_state.dart';

class YearlySajuMemberDetailCubit
    extends Cubit<YearlySajuMemberDetailState> {
  YearlySajuMemberDetailCubit({
    required this.yearlySajuRepository,
  }) : super(const YearlySajuMemberDetailState()) {
    _init();
  }

  final YearlySajuRepository yearlySajuRepository;

  void _init() async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      final memberInfo = await yearlySajuRepository.getSajuForm();
      final datingStatus = memberInfo.datingType;
      final jobStatus = memberInfo.jobStatus;
      final saveInfo = memberInfo.saveInfo;
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
    yearlySajuRepository.updateSajuForm(datingStatus: datingStatus);
    emit(
      state.copyWith(
        datingStatus: datingStatus,
      ),
    );
  }

  void changeJobStatus(JobStatus jobStatus) {
    yearlySajuRepository.updateSajuForm(jobStatus: jobStatus);
    emit(
      state.copyWith(
        jobStatus: jobStatus,
      ),
    );
  }

  void changeSaveInfo(bool saveInfo) {
    yearlySajuRepository.updateSajuForm(saveInfo: saveInfo);
    emit(
      state.copyWith(
        saveInfo: saveInfo,
      ),
    );
  }
}
