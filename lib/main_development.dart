import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:saju_mobile_v1/app/app.dart';
import 'package:saju_mobile_v1/bootstrap.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'assets/.env');
  await bootstrap(() => const App());
}
