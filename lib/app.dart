import 'package:saju/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    super.initState();
    _yearlySajuRepository = YearlySajuRepository();
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
          colorScheme: ColorScheme.light(
            primary: Colors.black,
            secondary: Colors.grey,
          ),
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
