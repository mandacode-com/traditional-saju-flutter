import 'package:traditional_saju/bootstrap.dart';
import 'package:traditional_saju/src/presentation/app/app.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
