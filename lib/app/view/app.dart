import 'package:api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart' as kakao;
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:saju_mobile_v1/l10n/l10n.dart';
import 'package:saju_mobile_v1/pages/home/view/page.dart';
import 'package:saju_mobile_v1/pages/home/view/page_sample.dart';
import 'package:saju_mobile_v1/pages/results/daily/view/page.dart';
import 'package:saju_mobile_v1/pages/results/yearly/view/page.dart';
import 'package:saju_mobile_v1/pages/user/base/view/page.dart';
import 'package:saju_mobile_v1/pages/user/detail/view/page.dart';
import 'package:saju_mobile_v1/route_observer.dart';
import 'package:saju_mobile_v1/storage/question/question_memory_storage.dart';
import 'package:saju_mobile_v1/storage/route/route_memory_storage.dart';
import 'package:saju_mobile_v1/storage/token/access_token_storage.dart';
import 'package:saju_mobile_v1/storage/token/refresh_token_storage.dart';
import 'package:saju_mobile_v1/storage/user/user_hive_storage.dart';
import 'package:saju_mobile_v1/storage/user/user_memory_storage.dart';
import 'package:storage/storage.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  RouteMemoryStorage appMemoryStorage = RouteMemoryStorage();
  AccessTokenStorage accessTokenStorage = AccessTokenStorage();
  RefreshTokenStorage refreshTokenStorage = RefreshTokenStorage(
    const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    ),
  );
  UserMemoryStorage userMemoryStorage = UserMemoryStorage();
  UserHiveStorage userHiveStorage = UserHiveStorage();
  QuestionStorage questionMemoryStorage = QuestionMemoryStorage();

  late final AuthRepository _authRepository;
  late final AppRepository _appRepository;
  late final SajuRepository _sajuRepository;

  static const googleClientEnvKey = 'GOOGLE_OAUTH_CLIENT_ID';

  @override
  void initState() {
    super.initState();

    final googleOauthClientId =
        const String.fromEnvironment(googleClientEnvKey).isNotEmpty
            ? const String.fromEnvironment(googleClientEnvKey)
            : dotenv.env[googleClientEnvKey] ?? '';
    final authApiBaseUrl =
        const String.fromEnvironment('AUTH_API_BASE_URL').isNotEmpty
            ? const String.fromEnvironment('AUTH_API_BASE_URL')
            : dotenv.env['AUTH_API_BASE_URL'] ?? '';
    final sajuApiBaseUrl =
        const String.fromEnvironment('SAJU_API_BASE_URL').isNotEmpty
            ? const String.fromEnvironment('SAJU_API_BASE_URL')
            : dotenv.env['SAJU_API_BASE_URL'] ?? '';

    final authDio = Dio(
      BaseOptions(
        baseUrl: authApiBaseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );
    final sajuDio = Dio(
      BaseOptions(
        baseUrl: sajuApiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(minutes: 1),
      ),
    );
    final googleSignIn = GoogleSignIn(
      serverClientId: googleOauthClientId,
      scopes: ['email', 'profile'],
    );

    _appRepository = AppRepository(
      routeStorage: appMemoryStorage,
      questionStorage: questionMemoryStorage,
    );
    _authRepository = AuthRepository(
      authApi: AuthApi(
        apiClient: ApiClient(dio: authDio),
        googleSignIn: googleSignIn,
        kakaoUserApi: kakao.UserApi.instance,
      ),
      accessTokenStorage: accessTokenStorage,
      refreshTokenStorage: refreshTokenStorage,
    );
    _sajuRepository = SajuRepository(
      authApi: AuthApi(
        apiClient: ApiClient(dio: authDio),
        googleSignIn: googleSignIn,
        kakaoUserApi: kakao.UserApi.instance,
      ),
      sajuApi: SajuApi(apiClient: ApiClient(dio: sajuDio)),
      accessTokenStorage: accessTokenStorage,
      refreshTokenStorage: refreshTokenStorage,
      userMemoryStorage: userMemoryStorage,
      questionMemoryStorage: questionMemoryStorage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => _authRepository,
        ),
        RepositoryProvider<AppRepository>(create: (context) => _appRepository),
        RepositoryProvider<UserRepository>(
          create:
              (context) => UserRepository(
                userMemoryStorage: userMemoryStorage,
                userHiveStorage: userHiveStorage,
              ),
        ),
        RepositoryProvider<SajuRepository>(
          create: (context) => _sajuRepository,
        ),
      ],
      child: MaterialApp(
        title: 'Saju Mobile',
        theme: ThemeData(
          primaryColor: const Color(0xFF000000),
          checkboxTheme: const CheckboxThemeData(
            checkColor: WidgetStatePropertyAll(Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
            fillColor:
                WidgetStateProperty.fromMap(<WidgetStatesConstraint, Color?>{
                  WidgetState.selected: Colors.black,
                  WidgetState.focused: Colors.black,
                  WidgetState.error: Colors.black,
                  WidgetState.disabled: Colors.black12,
                  WidgetState.any: Colors.transparent,
                }),
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
          ),
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF000000),
            secondary: Color(0xFFFFFFFF),
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
            headlineLarge: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'NanumSquareNeo',
              fontSize: 20,
            ),
            headlineMedium: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontFamily: 'MapoFlowerIsland',
              fontSize: 13,
            ),
            bodyMedium: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'NanumSquareNeo',
              fontSize: 13,
            ),
            bodyLarge: const TextStyle(color: Colors.black),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF000000),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF000000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadowColor: Colors.transparent,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomePage(),
        navigatorObservers: [routeObserver],
        routes: <String, WidgetBuilder>{
          AppRoutes.home.toString(): (context) => const HomePage(),
          AppRoutes.homeSample.toString(): (context) => const HomePageSample(),
          AppRoutes.userInfoBase.toString():
              (context) => const UserInfoBasePage(),
          AppRoutes.userInfoDetail.toString():
              (context) => const UserInfoDetailPage(),
          AppRoutes.yearlyResult.toString():
              (context) => const YearlySajuResultPage(),
          AppRoutes.dailyResult.toString():
              (context) => const DailySajuResultPage(),
        },
      ),
    );
  }
}
