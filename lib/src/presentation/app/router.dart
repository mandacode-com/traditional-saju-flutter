import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:traditional_saju/src/presentation/features/daily_fortune/pages/daily_fortune_page.dart';
import 'package:traditional_saju/src/presentation/features/home/pages/home_page.dart';
import 'package:traditional_saju/src/presentation/features/user/bloc/user_info_bloc.dart';
import 'package:traditional_saju/src/presentation/features/user/pages/user_additional_info_page.dart';
import 'package:traditional_saju/src/presentation/features/user/pages/user_info_form_page.dart';
import 'package:traditional_saju/src/presentation/features/yearly_fortune/pages/yearly_fortune_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: '/user-info-form',
      name: UserInfoFormPage.routeName,
      pageBuilder: (context, state) {
        final targetFortune = state.extra as String?;
        return MaterialPage<void>(
          key: state.pageKey,
          child: UserInfoFormPage(targetFortune: targetFortune),
        );
      },
    ),
    GoRoute(
      path: '/user-additional-info',
      name: UserAdditionalInfoPage.routeName,
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        final bloc = extra?['bloc'] as UserInfoBloc?;
        final targetFortune = extra?['targetFortune'] as String?;
        return MaterialPage<void>(
          key: state.pageKey,
          child: UserAdditionalInfoPage(
            bloc: bloc,
            targetFortune: targetFortune,
          ),
        );
      },
    ),
    GoRoute(
      path: '/daily-fortune',
      name: DailyFortunePage.routeName,
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const DailyFortunePage(),
      ),
    ),
    GoRoute(
      path: '/yearly-fortune',
      name: YearlyFortunePage.routeName,
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const YearlyFortunePage(),
      ),
    ),
  ],
);
