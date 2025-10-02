import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:traditional_saju/src/application/ports/auth/auth_port.dart';
import 'package:traditional_saju/src/application/ports/saju/saju_port.dart';
import 'package:traditional_saju/src/application/ports/user/user_port.dart';
import 'package:traditional_saju/src/application/use_cases/auth/check_auth_status_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/auth/sign_in_with_google_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/auth/sign_in_with_kakao_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/auth/sign_out_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/saju/get_basic_saju_chart_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/saju/get_complete_saju_chart_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/saju/get_daily_fortune_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/saju/get_saju_chart_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/saju/get_yearly_fortune_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/user/check_user_exists_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/user/delete_user_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/user/get_current_user_use_case.dart';
import 'package:traditional_saju/src/application/use_cases/user/update_user_nickname_use_case.dart';
import 'package:traditional_saju/src/config/oauth_config.dart';
import 'package:traditional_saju/src/infrastructure/adapter/auth/auth_adapter.dart';
import 'package:traditional_saju/src/infrastructure/adapter/saju/saju_adapter.dart';
import 'package:traditional_saju/src/infrastructure/adapter/user/user_adapter.dart';
import 'package:traditional_saju/src/infrastructure/client/api_client.dart';
import 'package:traditional_saju/src/infrastructure/oauth/google_oauth_helper.dart';
import 'package:traditional_saju/src/infrastructure/oauth/kakao_oauth_helper.dart';
import 'package:traditional_saju/src/infrastructure/storage/token_storage_service.dart';
import 'package:traditional_saju/src/infrastructure/storage/user_storage_service.dart';
import 'package:traditional_saju/src/presentation/features/auth/bloc/auth_bloc.dart';

final GetIt getIt = GetIt.instance;

/// Initialize dependency injection container
Future<void> setupServiceLocator() async {
  // Configuration (loaded from .env in bootstrap)
  getIt.registerLazySingleton<OAuthConfig>(OAuthConfig.fromEnv);

  // Core dependencies
  getIt.registerLazySingleton<Logger>(Logger.new);
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  // Storage services
  getIt.registerLazySingleton<TokenStorageService>(
    () => TokenStorageService(
      secureStorage: getIt<FlutterSecureStorage>(),
    ),
  );
  getIt.registerLazySingleton<UserStorageService>(
    () => UserStorageService(boxName: 'user_info'),
  );

  // Initialize UserStorageService
  await getIt<UserStorageService>().init();

  // HTTP Client
  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(
      baseUrl: 'https://saju.mandacode.com/api/v1',
      secureStorage: getIt<FlutterSecureStorage>(),
      logger: getIt<Logger>(),
    ),
  );

  // OAuth helpers
  getIt.registerLazySingleton<GoogleOAuthHelper>(
    () => GoogleOAuthHelper(config: getIt<OAuthConfig>()),
  );
  getIt.registerLazySingleton<KakaoOAuthHelper>(KakaoOAuthHelper.new);

  // Adapters (Ports implementations)
  getIt.registerLazySingleton<AuthPort>(
    () => AuthAdapter(
      apiClient: getIt<ApiClient>(),
    ),
  );
  getIt.registerLazySingleton<UserPort>(
    () => UserAdapter(
      apiClient: getIt<ApiClient>(),
    ),
  );
  getIt.registerLazySingleton<SajuPort>(
    () => SajuAdapter(
      apiClient: getIt<ApiClient>(),
      userStorage: getIt<UserStorageService>(),
    ),
  );

  // Auth Use Cases
  getIt.registerLazySingleton(
    () => SignInWithGoogleUseCase(authPort: getIt<AuthPort>()),
  );
  getIt.registerLazySingleton(
    () => SignInWithKakaoUseCase(authPort: getIt<AuthPort>()),
  );
  getIt.registerLazySingleton(
    () => SignOutUseCase(authPort: getIt<AuthPort>()),
  );
  getIt.registerLazySingleton(
    () => CheckAuthStatusUseCase(authPort: getIt<AuthPort>()),
  );

  // User Use Cases
  getIt.registerLazySingleton(
    () => GetCurrentUserUseCase(userPort: getIt<UserPort>()),
  );
  getIt.registerLazySingleton(
    () => CheckUserExistsUseCase(userPort: getIt<UserPort>()),
  );
  getIt.registerLazySingleton(
    () => UpdateUserNicknameUseCase(userPort: getIt<UserPort>()),
  );
  getIt.registerLazySingleton(
    () => DeleteUserUseCase(userPort: getIt<UserPort>()),
  );

  // Saju Use Cases
  getIt.registerLazySingleton(
    () => GetDailyFortuneUseCase(sajuPort: getIt<SajuPort>()),
  );
  getIt.registerLazySingleton(
    () => GetYearlyFortuneUseCase(sajuPort: getIt<SajuPort>()),
  );
  getIt.registerLazySingleton(
    () => GetSajuChartUseCase(sajuPort: getIt<SajuPort>()),
  );
  getIt.registerLazySingleton(
    () => GetBasicSajuChartUseCase(sajuPort: getIt<SajuPort>()),
  );
  getIt.registerLazySingleton(
    () => GetCompleteSajuChartUseCase(sajuPort: getIt<SajuPort>()),
  );

  // BLoCs
  getIt.registerFactory(
    () => AuthBloc(
      checkAuthStatus: getIt<CheckAuthStatusUseCase>(),
      signInWithGoogle: getIt<SignInWithGoogleUseCase>(),
      signInWithKakao: getIt<SignInWithKakaoUseCase>(),
      signOut: getIt<SignOutUseCase>(),
      googleOAuthHelper: getIt<GoogleOAuthHelper>(),
      kakaoOAuthHelper: getIt<KakaoOAuthHelper>(),
    ),
  );
}
