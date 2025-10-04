import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traditional_saju/src/infrastructure/di/service_locator.dart';
import 'package:traditional_saju/src/presentation/app/l10n/l10n.dart';
import 'package:traditional_saju/src/presentation/app/router.dart';
import 'package:traditional_saju/src/presentation/app/theme/app_theme.dart';
import 'package:traditional_saju/src/presentation/features/auth/bloc/auth_bloc.dart';
import 'package:traditional_saju/src/presentation/features/auth/bloc/auth_event.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>()..add(const AuthCheckRequested()),
      child: MaterialApp.router(
        title: 'Traditional Saju',
        routerConfig: router,
        theme: AppTheme.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
