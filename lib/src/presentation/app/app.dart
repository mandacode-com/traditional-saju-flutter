import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traditional_saju/src/di/service_locator.dart';
import 'package:traditional_saju/src/presentation/app/l10n/l10n.dart';
import 'package:traditional_saju/src/presentation/features/auth/bloc/auth_bloc.dart';
import 'package:traditional_saju/src/presentation/features/auth/bloc/auth_event.dart';
import 'package:traditional_saju/src/presentation/features/home/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>()..add(const AuthCheckRequested()),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomePage(),
      ),
    );
  }
}
