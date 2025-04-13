import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:saju_mobile_v1/pages/home/bloc/event.dart';
import 'package:saju_mobile_v1/pages/home/bloc/state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const HomeState()) {
    on<HomeSubscriptionRequested>(_onSubscriptionRequested);
    on<GoogleLoginRequested>(_onGoogleLoginRequested);
    on<KakaoLoginRequested>(_onKakaoLoginRequested);
    on<HomeLogoutRequested>(_onLogoutRequested);
  }

  final AuthRepository _authRepository;

  Future<void> _onSubscriptionRequested(
    HomeSubscriptionRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        formStatus: FormStatus.loading,
      ),
    );

    try {
      // Check if the user is logged in
      final isLoggedIn = await _authRepository.verifyToken();
      if (isLoggedIn) {
        // If the user is logged in, refresh the token
        emit(
          state.copyWith(
            formStatus: FormStatus.success,
            isLoggedIn: isLoggedIn,
          ),
        );
      } else {
        // If the user is not logged in, refresh the token
        // If the refresh token is expired, the user will be logged out
        await _authRepository.refreshToken();
        emit(
          state.copyWith(
            formStatus: FormStatus.success,
            isLoggedIn: true,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          formStatus: FormStatus.failure,
          isLoggedIn: false,
        ),
      );
    }
  }

  Future<void> _onGoogleLoginRequested(
    GoogleLoginRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        formStatus: FormStatus.loading,
      ),
    );

    try {
      await _authRepository.signInWithGoogle().then((isLoggedIn) {
        emit(
          state.copyWith(
            formStatus: FormStatus.success,
            isLoggedIn: isLoggedIn,
          ),
        );
      });
    } catch (e) {
      emit(
        state.copyWith(
          formStatus: FormStatus.failure,
          isLoggedIn: false,
        ),
      );
    }
  }

  Future<void> _onKakaoLoginRequested(
    KakaoLoginRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        formStatus: FormStatus.loading,
      ),
    );

    try {
      await _authRepository.signInWithKakao().then((isLoggedIn) {
        emit(
          state.copyWith(
            formStatus: FormStatus.success,
            isLoggedIn: isLoggedIn,
          ),
        );
      });
    } catch (e) {
      emit(
        state.copyWith(
          formStatus: FormStatus.failure,
          isLoggedIn: false,
        ),
      );
    }
  }

  Future<void> _onLogoutRequested(
    HomeLogoutRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        formStatus: FormStatus.loading,
      ),
    );

    try {
      await _authRepository.logout();
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          isLoggedIn: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          formStatus: FormStatus.failure,
          isLoggedIn: true,
        ),
      );
    }
  }
}
