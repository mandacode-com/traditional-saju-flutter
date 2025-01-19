import 'package:byul_mobile/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_year_saju_repository/new_year_saju_repository.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final NewYearSajuRepository _newYearSajuRepository;

  @override
  void initState() {
    super.initState();
    _newYearSajuRepository = NewYearSajuRepository();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => _newYearSajuRepository,
      child: MaterialApp(
        title: 'Byuljogak Saju',
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
        home: const Home(title: 'Byuljogak Saju'),
      ),
    );
  }
}
