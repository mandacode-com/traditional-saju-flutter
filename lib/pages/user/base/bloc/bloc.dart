import 'package:bloc/bloc.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:saju_mobile_v1/pages/user/base/bloc/event.dart';
import 'package:saju_mobile_v1/pages/user/base/bloc/state.dart';
import 'package:saju_mobile_v1/pages/user/base/model/formed_birth.dart';
import 'package:saju_mobile_v1/pages/user/base/model/formed_birth_hour.dart';
import 'package:saju_mobile_v1/pages/user/base/model/formed_birth_min.dart';

class UserInfoBaseBloc extends Bloc<UserInfoBaseEvent, UserInfoBaseState> {
  UserInfoBaseBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const UserInfoBaseState()) {
    on<UserInfoBaseSubscriptionRequested>(_onSubscriptionRequested);
    on<UserInfoBaseGenderChanged>(_onGenderChanged);
    on<UserInfoBaseBirthDateChanged>(_onBirthDateChanged);
    on<UserInfoBaseBirthHourChanged>(_onBirthHourChanged);
    on<UserInfoBaseBirthMinutesChanged>(_onBirthMinutesChanged);
    on<UserInfoBaseTimeDisabledChanged>(_onTimeDisabledChanged);
  }

  final UserRepository _userRepository;

  Future<void> _onSubscriptionRequested(
    UserInfoBaseSubscriptionRequested event,
    Emitter<UserInfoBaseState> emit,
  ) async {
    emit(
      state.copyWith(
        formStatus: FormStatus.loading,
      ),
    );

    try {
      final currentUser = await _userRepository.getMemoryUser();
      if (currentUser == null) {
        emit(
          state.copyWith(
            formStatus: FormStatus.success,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          gender: currentUser.gender,
          birthDate: FormedBirthDate.dirty(currentUser.birthdate),
          timeDisabled: currentUser.timeDisabled,
        ),
      );
      return;
    } catch (e) {
      emit(
        state.copyWith(
          formStatus: FormStatus.failure,
        ),
      );
    }
  }

  Future<void> _onGenderChanged(
    UserInfoBaseGenderChanged event,
    Emitter<UserInfoBaseState> emit,
  ) async {
    try {
      await _userRepository.updateUser(
        gender: event.gender,
      );
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          gender: event.gender,
        ),
      );
    } catch (e) {
      emit(state.copyWith(formStatus: FormStatus.failure));
    }
  }

  Future<void> _onBirthDateChanged(
    UserInfoBaseBirthDateChanged event,
    Emitter<UserInfoBaseState> emit,
  ) async {
    try {
      final newBirthDateTime = DateTime(
        event.birthDate.year,
        event.birthDate.month,
        event.birthDate.day,
        state.birthHour.value,
        state.birthMinutes.value,
      );
      await _userRepository.updateUser(
        birthdate: newBirthDateTime,
      );
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          birthDate: FormedBirthDate.dirty(event.birthDate),
        ),
      );
    } catch (e) {
      emit(state.copyWith(formStatus: FormStatus.failure));
    }
  }

  Future<void> _onBirthHourChanged(
    UserInfoBaseBirthHourChanged event,
    Emitter<UserInfoBaseState> emit,
  ) async {
    try {
      final newBirthDateTime = DateTime(
        state.birthDate.value!.year,
        state.birthDate.value!.month,
        state.birthDate.value!.day,
        event.birthHour,
        state.birthMinutes.value,
      );
      await _userRepository.updateUser(
        birthdate: newBirthDateTime,
      );
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          birthHour: FormedBirthHour.dirty(event.birthHour),
        ),
      );
    } catch (e) {
      emit(state.copyWith(formStatus: FormStatus.failure));
    }
  }

  Future<void> _onBirthMinutesChanged(
    UserInfoBaseBirthMinutesChanged event,
    Emitter<UserInfoBaseState> emit,
  ) async {
    try {
      final newBirthDateTime = DateTime(
        state.birthDate.value!.year,
        state.birthDate.value!.month,
        state.birthDate.value!.day,
        state.birthHour.value,
        event.birthMinutes,
      );
      await _userRepository.updateUser(
        birthdate: newBirthDateTime,
      );
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          birthMinutes: FormedBirthMinutes.dirty(event.birthMinutes),
        ),
      );
    } catch (e) {
      emit(state.copyWith(formStatus: FormStatus.failure));
    }
  }

  Future<void> _onTimeDisabledChanged(
    UserInfoBaseTimeDisabledChanged event,
    Emitter<UserInfoBaseState> emit,
  ) async {
    try {
      await _userRepository.updateUser(
        timeDisabled: event.timeDisabled,
      );
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          timeDisabled: event.timeDisabled,
        ),
      );
    } catch (e) {
      emit(state.copyWith(formStatus: FormStatus.failure));
    }
  }
}
