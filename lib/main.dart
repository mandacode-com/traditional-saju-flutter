import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:saju/app.dart';
import 'package:flutter/material.dart';

void main() async {
  await dotenv.load(fileName: "assets/config/.env");
  runApp(const App());
}
