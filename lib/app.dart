import 'package:api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:repository/repository.dart';
import 'package:saju/home.dart';
import 'package:flutter/material.dart';
import 'package:storage/storage.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final UserInfoStorage _userInfoStorage = UserInfoStorage();
  late final UserInfoRepository _userInfoRepository;
  late final DailySajuRepository _dailySajuRepository;
  late final YearlySajuRepository _yearlySajuRepository;

  @override
  void initState() {
    Dio client = Dio(BaseOptions(
      baseUrl: dotenv.env['API_BASE_URL']!,
    ));

    super.initState();
    _userInfoRepository = UserInfoRepository(userInfoStorage: _userInfoStorage);
    _dailySajuRepository = DailySajuRepository(
        api: DailySajuApi(client: client), userInfoStorage: _userInfoStorage);
    _yearlySajuRepository = YearlySajuRepository(
        api: YearlySajuApi(client: client), userInfoStorage: _userInfoStorage);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserInfoRepository>.value(value: _userInfoRepository),
        Provider<DailySajuRepository>.value(value: _dailySajuRepository),
        Provider<YearlySajuRepository>.value(value: _yearlySajuRepository),
      ],
      child: MaterialApp(
        title: 'Saju',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
          ),
          dividerTheme: DividerThemeData(
            color: Colors.transparent,
            space: 0,
            thickness: 0,
          ),
          colorScheme: ColorScheme.light(
            primary: Colors.black,
            secondary: Colors.grey,
          ),
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              fontSize: 12,
              fontFamily: "NanumSquareNeo",
            ),
          ),
          primaryTextTheme: TextTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.transparent,
              backgroundColor: Colors.grey,
              foregroundColor: Colors.black,
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.lightBlue,
            textTheme: ButtonTextTheme.normal,
          ),
        ),
        home: Home(),
      ),
    );
  }
}
