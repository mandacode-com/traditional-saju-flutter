import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:traditional_saju/src/presentation/app/app.dart';

void main() {
  group('App', () {
    testWidgets('renders MaterialApp', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
