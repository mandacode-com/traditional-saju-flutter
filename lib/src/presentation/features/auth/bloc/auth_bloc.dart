import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traditional_saju/src/application/use_cases/auth/check_auth_status_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/auth/sign_in_with_google_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/auth/sign_in_with_kakao_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/auth/sign_out_use_case.dart';
import 'package:traditional_saju/src/infrastructure/oauth/google_oauth_helper.dart';
import 'package:traditional_saju/src/infrastructure/oauth/kakao_oauth_helper.dart';
import 'package:traditional_saju/src/presentation/features/auth/bloc/auth_event.dart';
import 'package:traditional_saju/src/presentation/features/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required CheckAuthStatusUseCase checkAuthStatus,
    required SignInWithGoogleUseCase signInWithGoogle,
    required SignInWithKakaoUseCase signInWithKakao,
    required SignOutUseCase signOut,
    required GoogleOAuthHelper googleOAuthHelper,
    required KakaoOAuthHelper kakaoOAuthHelper,
  }) : _checkAuthStatus = checkAuthStatus,
       _signInWithGoogle = signInWithGoogle,
       _signInWithKakao = signInWithKakao,
       _signOut = signOut,
       _googleOAuthHelper = googleOAuthHelper,
       _kakaoOAuthHelper = kakaoOAuthHelper,
       super(const AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<AuthGoogleSignInRequested>(_onGoogleSignInRequested);
    on<AuthKakaoSignInRequested>(_onKakaoSignInRequested);
    on<AuthSignOutRequested>(_onSignOutRequested);
  }

  final CheckAuthStatusUseCase _checkAuthStatus;
  final SignInWithGoogleUseCase _signInWithGoogle;
  final SignInWithKakaoUseCase _signInWithKakao;
  final SignOutUseCase _signOut;
  final GoogleOAuthHelper _googleOAuthHelper;
  final KakaoOAuthHelper _kakaoOAuthHelper;

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final isAuthenticated = await _checkAuthStatus.execute();
      if (isAuthenticated) {
        emit(const AuthAuthenticated());
      } else {
        emit(const AuthUnauthenticated());
      }
    } on Exception catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onGoogleSignInRequested(
    AuthGoogleSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final googleAccessToken = await _googleOAuthHelper.signIn();
      if (googleAccessToken == null) {
        emit(const AuthError('Google sign in cancelled'));
        return;
      }

      await _signInWithGoogle.execute(googleAccessToken);
      emit(const AuthAuthenticated());
    } on Exception catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onKakaoSignInRequested(
    AuthKakaoSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final kakaoAccessToken = await _kakaoOAuthHelper.signIn();
      if (kakaoAccessToken == null) {
        emit(const AuthError('Kakao sign in cancelled'));
        return;
      }

      await _signInWithKakao.execute(kakaoAccessToken);
      emit(const AuthAuthenticated());
    } on Exception catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await _signOut.execute();
      await _googleOAuthHelper.signOut();
      await _kakaoOAuthHelper.signOut();
      emit(const AuthUnauthenticated());
    } on Exception catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
