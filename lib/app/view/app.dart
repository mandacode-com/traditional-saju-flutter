import 'package:flutter/material.dart';
import 'package:saju_mobile_v1/l10n/l10n.dart';
import 'package:saju_mobile_v1/pages/home/view/page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saju Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomePage(),
    );
  }
}
