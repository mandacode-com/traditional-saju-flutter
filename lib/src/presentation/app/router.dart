import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const Scaffold(
          body: Center(
            child: Text('Login Page'),
          ),
        ),
      ),
    ),
  ],
);
