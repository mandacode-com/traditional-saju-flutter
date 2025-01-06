import 'package:byul_mobile/new_year_saju/new_year_saju.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_year_saju_repository/new_year_saju_repository.dart';

part 'home.dart';

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const Home(title: 'Byuljogak Saju'),
      ),
    );
  }
}

