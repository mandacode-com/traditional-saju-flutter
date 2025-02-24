import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:saju/base_info/form_status.dart';
import 'package:saju/base_info/member_info/model/member_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'member_info_state.dart';
part 'member_info_event.dart';

class UserInfoBloc
    extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc({
    required UserInfoRepository userInfoRepository,
  })  : _userInfoRepository = userInfoRepository,
        super(const UserInfoState()) {
    on<MemberInfoSubscriptionRequested>(_onSubscriptionRequested);
    on<MemberInfoGenderChanged>(_onGenderChanged);
    on<MemberInfoBirthDateChanged>(_onBirthDateChanged);
    on<MemberInfoBirthHourChanged>(_onBirthHourChanged);
    on<MemberInfoBirthMinuteChanged>(_onBirthMinuteChanged);
    on<MemberInfoBirthTimeDisabledChanged>(_onBirthTimeDisabledChanged);
  }

  final UserInfoRepository _userInfoRepository;

  void _onSubscriptionRequested(MemberInfoSubscriptionRequested event,
      Emitter<UserInfoState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      final localStorageUserInfo = await _userInfoRepository.getUserInfo();
      final gender = localStorageUserInfo.gender;

      final birthDateTime = localStorageUserInfo.birthDateTime ?? DateTime.now();

      // If the birthDateTime is null, update the birthDateTime with the current date time.
      if (localStorageUserInfo.birthDateTime == null) {
        _userInfoRepository.updateUserInfoWith(
          birthDateTime: birthDateTime,
        );
      }

      final birthDate = BirthDate.dirty(
          DateTime(birthDateTime.year, birthDateTime.month, birthDateTime.day));
      final birthHour = BirthHour.dirty(birthDateTime.hour);
      final birthMinute = BirthMinute.dirty(birthDateTime.minute);
      emit(
        state.copyWith(
          status: FormStatus.success,
          gender: gender,
          birthDate: birthDate,
          birthHour: birthHour,
          birthMinute: birthMinute,
          birthTimeDisabled: localStorageUserInfo.birthTimeDisabled,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FormStatus.failure));
    }
  }

  void _onGenderChanged(MemberInfoGenderChanged event,
      Emitter<UserInfoState> emit) async {
    _userInfoRepository.updateUserInfoWith(gender: event.gender);

    emit(
      state.copyWith(
        gender: event.gender,
      ),
    );
  }

  void _onBirthDateChanged(MemberInfoBirthDateChanged event,
      Emitter<UserInfoState> emit) async {
    final birthDate = BirthDate.dirty(event.birthDate);

    _userInfoRepository.updateUserInfoWith(
      birthDateTime: DateTime(
        event.birthDate.year,
        event.birthDate.month,
        event.birthDate.day,
        state.birthHour.value,
        state.birthMinute.value,
      ),
    );

    emit(
      state.copyWith(
        birthDate: birthDate,
      ),
    );
  }

  void _onBirthHourChanged(MemberInfoBirthHourChanged event,
      Emitter<UserInfoState> emit) async {
    final birthHour = BirthHour.dirty(event.birthHour);

    final currentBirthDateTime = DateTime.now();

    _userInfoRepository.updateUserInfoWith(
      birthDateTime: DateTime(
        state.birthDate.value?.year ?? currentBirthDateTime.year,
        state.birthDate.value?.month ?? currentBirthDateTime.month,
        state.birthDate.value?.day ?? currentBirthDateTime.day,
        event.birthHour,
        state.birthMinute.value,
      ),
    );

    emit(
      state.copyWith(
        birthHour: birthHour,
      ),
    );
  }

  void _onBirthMinuteChanged(MemberInfoBirthMinuteChanged event,
      Emitter<UserInfoState> emit) async {
    final birthMinute = BirthMinute.dirty(event.birthMinute);

    final currentBirthDateTime = DateTime.now();

    _userInfoRepository.updateUserInfoWith(
      birthDateTime: DateTime(
        state.birthDate.value?.year ?? currentBirthDateTime.year,
        state.birthDate.value?.month ?? currentBirthDateTime.month,
        state.birthDate.value?.day ?? currentBirthDateTime.day,
        state.birthHour.value,
        event.birthMinute,
      ),
    );

    emit(
      state.copyWith(
        birthMinute: birthMinute,
      ),
    );
  }

  void _onBirthTimeDisabledChanged(MemberInfoBirthTimeDisabledChanged event,
      Emitter<UserInfoState> emit) async {
    _userInfoRepository.updateUserInfoWith(
      birthTimeDisabled: event.disabled,
    );

    emit(
      state.copyWith(
        birthTimeDisabled: event.disabled,
      ),
    );
  }
}
