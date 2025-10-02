import 'package:traditional_saju/bootstrap.dart';
import 'package:traditional_saju/src/presentation/app/app.dart';

void main() {
  bootstrap(() => const App(), environment: 'staging');
}
