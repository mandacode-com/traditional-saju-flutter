import 'package:flutter_test/flutter_test.dart';
import 'package:saju_mobile_v1/app/app.dart';
import 'package:saju_mobile_v1/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
