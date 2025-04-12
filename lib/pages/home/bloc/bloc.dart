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
      await _authRepository.verifyToken().then((isLoggedIn) {
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

  void _onLogoutRequested(
    HomeLogoutRequested event,
    Emitter<HomeState> emit,
  ) {
    // Handle logout request
  }
}
