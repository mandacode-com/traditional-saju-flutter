import 'package:bloc/bloc.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:saju_mobile_v1/pages/user/detail/bloc/event.dart';
import 'package:saju_mobile_v1/pages/user/detail/bloc/state.dart';

class UserInfoDetailBloc
    extends Bloc<UserInfoDetailEvent, UserInfoDetailState> {
  UserInfoDetailBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const UserInfoDetailState()) {
    on<UserInfoDetailSubscriptionRequested>(
      _onSubscriptionRequested,
    );
    on<UserInfoDetailDatingChanged>(
      _onDatingChanged,
    );
    on<UserInfoDetailJobChanged>(
      _onJobChanged,
    );
    on<UserInfoDetailPermanentChanged>(
      _onPermanentChanged,
    );
    on<UserInfoDetailFormSubmitted>(
      _onFormSubmitted,
    );
  }

  final UserRepository _userRepository;

  Future<void> _onSubscriptionRequested(
    UserInfoDetailSubscriptionRequested event,
    Emitter<UserInfoDetailState> emit,
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
          datingStatus: currentUser.datingStatus,
          jobStatus: currentUser.jobStatus,
          permanent: currentUser.permanent,
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

  Future<void> _onDatingChanged(
    UserInfoDetailDatingChanged event,
    Emitter<UserInfoDetailState> emit,
  ) async {
    try {
      await _userRepository.updateUser(
        datingStatus: event.datingStatus,
      );
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          datingStatus: event.datingStatus,
        ),
      );
    } catch (e) {
      emit(state.copyWith(formStatus: FormStatus.failure));
    }
  }

  Future<void> _onJobChanged(
    UserInfoDetailJobChanged event,
    Emitter<UserInfoDetailState> emit,
  ) async {
    try {
      await _userRepository.updateUser(
        jobStatus: event.jobStatus,
      );
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          jobStatus: event.jobStatus,
        ),
      );
    } catch (e) {
      emit(state.copyWith(formStatus: FormStatus.failure));
    }
  }

  Future<void> _onPermanentChanged(
    UserInfoDetailPermanentChanged event,
    Emitter<UserInfoDetailState> emit,
  ) async {
    try {
      await _userRepository.updateUser(
        permanent: event.permanent,
      );
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          permanent: event.permanent,
        ),
      );
    } catch (e) {
      emit(state.copyWith(formStatus: FormStatus.failure));
    }
  }

  Future<void> _onFormSubmitted(
    UserInfoDetailFormSubmitted event,
    Emitter<UserInfoDetailState> emit,
  ) async {
    try {
      if (state.permanent) {
        await _userRepository.pushUserToHive();
      }
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(formStatus: FormStatus.failure));
    }
  }
}
