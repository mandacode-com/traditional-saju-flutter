import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:traditional_saju/src/di/service_locator.dart';
import 'package:traditional_saju/src/infrastructure/storage/storage_initializer.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    debugPrint('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  String environment = 'development',
}) async {
  FlutterError.onError = (details) {
    debugPrint(details.exceptionAsString());
    debugPrint(details.stack.toString());
  };

  Bloc.observer = const AppBlocObserver();

  // Load environment variables
  final envFile = '.env.$environment';
  try {
    await dotenv.load(fileName: envFile);
  } on Exception catch (e) {
    dotenv.testLoad(mergeWith: {});
  }

  // Initialize storage (Hive)
  await StorageInitializer.initialize();

  // Initialize dependency injection
  await setupServiceLocator();

  runApp(await builder());
}
