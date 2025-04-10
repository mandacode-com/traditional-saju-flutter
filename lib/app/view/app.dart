import 'package:api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:saju_mobile_v1/l10n/l10n.dart';
import 'package:saju_mobile_v1/pages/home/view/page.dart';
import 'package:saju_mobile_v1/pages/results/yearly/view/page.dart';
import 'package:saju_mobile_v1/pages/user/base/view/page.dart';
import 'package:saju_mobile_v1/pages/user/detail/view/page.dart';
import 'package:saju_mobile_v1/storage/app/app_memory_storage.dart';
import 'package:saju_mobile_v1/storage/token/access_token_storage.dart';
import 'package:saju_mobile_v1/storage/token/refresh_token_storage.dart';
import 'package:saju_mobile_v1/storage/user/user_hive_storage.dart';
import 'package:saju_mobile_v1/storage/user/user_memory_storage.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppMemoryStorage appMemoryStorage = AppMemoryStorage();
  AccessTokenStorage accessTokenStorage = AccessTokenStorage();
  RefreshTokenStorage refreshTokenStorage = RefreshTokenStorage(
    const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    ),
  );
  UserMemoryStorage userMemoryStorage = UserMemoryStorage();
  UserHiveStorage userHiveStorage = UserHiveStorage();

  late final AuthRepository _authRepository;
  late final AppRepository _appRepository;

  static const googleClientEnvKey = 'GOOGLE_OAUTH_CLIENT_ID';

  @override
  void initState() {
    super.initState();

    final googleOauthClientId = const String.fromEnvironment(
      googleClientEnvKey,
    ).isNotEmpty
        ? const String.fromEnvironment(
            googleClientEnvKey,
          )
        : dotenv.env[googleClientEnvKey] ?? '';

    final authDio = Dio(
      BaseOptions(
        baseUrl: 'https://auth.mandacode.com/api/core',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );
    final googleSignIn = GoogleSignIn(
      serverClientId: googleOauthClientId,
      scopes: [
        'email',
        'profile',
      ],
    );

    _appRepository = AppRepository(
      appStorage: appMemoryStorage,
    );
    _authRepository = AuthRepository(
      authApi: AuthApi(
        apiClient: ApiClient(dio: authDio),
        googleSignIn: googleSignIn,
      ),
      accessTokenStorage: accessTokenStorage,
      refreshTokenStorage: refreshTokenStorage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => _authRepository,
        ),
        RepositoryProvider<AppRepository>(
          create: (context) => _appRepository,
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(
            userMemoryStorage: userMemoryStorage,
            userHiveStorage: userHiveStorage,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Saju Mobile',
        theme: ThemeData(
          primaryColor: const Color(0xFF000000),
          checkboxTheme: const CheckboxThemeData(
            checkColor: WidgetStatePropertyAll(
              Colors.white,
            ),
            fillColor: WidgetStateProperty.fromMap(
              <WidgetStatesConstraint, Color?>{
                WidgetState.selected: Colors.black,
                WidgetState.focused: Colors.black,
                WidgetState.error: Colors.black,
                WidgetState.disabled: Colors.grey,
              },
            ),
            overlayColor: WidgetStatePropertyAll(
              Colors.transparent,
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
          ),
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          colorScheme: const ColorScheme.light(),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyMedium: const TextStyle(
                  color: Colors.black,
                ),
                bodyLarge: const TextStyle(
                  color: Colors.black,
                ),
              ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomePage(),
        routes: <String, WidgetBuilder>{
          AppRoutes.home.toString(): (context) => const HomePage(),
          AppRoutes.userInfoBase.toString(): (context) =>
              const UserInfoBasePage(),
          AppRoutes.userInfoDetail.toString(): (context) =>
              const UserInfoDetailPage(),
          AppRoutes.yearlyResult.toString(): (context) =>
              const YearlyResultPage(),
        },
      ),
    );
  }
}
