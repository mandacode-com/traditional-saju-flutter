import 'package:api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:repository/repository.dart';
import 'package:saju_mobile_v1/l10n/l10n.dart';
import 'package:saju_mobile_v1/pages/home/view/page.dart';
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
      ],
      child: MaterialApp(
        title: 'Saju Mobile',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: HomePage(),
      ),
    );
  }
}
