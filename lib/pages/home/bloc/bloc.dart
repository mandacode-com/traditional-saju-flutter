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
    on<HomeLoginRequested>(_onLoginRequested);
    on<HomeLogoutRequested>(_onLogoutRequested);
  }

  final AuthRepository _authRepository;

  void _onSubscriptionRequested(
    HomeSubscriptionRequested event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        formStatus: FormStatus.loading,
      ),
    );

    try {
      final isLoggedIn = _authRepository.verifyToken(token);
      if (isLoggedIn) {
        emit(
          state.copyWith(
            formStatus: FormStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            formStatus: FormStatus.failure,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          formStatus: FormStatus.failure,
        ),
      );
    }
  }

  void _onLoginRequested(
    HomeLoginRequested event,
    Emitter<HomeState> emit,
  ) {
    // Handle login request
  }

  void _onLogoutRequested(
    HomeLogoutRequested event,
    Emitter<HomeState> emit,
  ) {
    // Handle logout request
  }
}
