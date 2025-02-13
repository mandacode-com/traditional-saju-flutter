import 'package:http/http.dart';
import 'package:saju/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saju_api/saju_api.dart';
import 'package:yearly_saju_repository/yearly_saju_repository.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final YearlySajuRepository _yearlySajuRepository;

  @override
  void initState() {
    Client client = Client();
    super.initState();
    _yearlySajuRepository = YearlySajuRepository(
      yearlySajuApiClient: SajuApi(
        yearlySajuApi: YearlySajuApi(client: client),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => _yearlySajuRepository,
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
