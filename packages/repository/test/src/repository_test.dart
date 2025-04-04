// ignore_for_file: prefer_const_constructors
import 'package:repository/repository.dart';
import 'package:test/test.dart';

void main() {
  group('Repository', () {
    test('can be instantiated', () {
      expect(Repository(), isNotNull);
    });
  });
}
