// ignore_for_file: prefer_const_constructors
import 'package:storage/storage.dart';
import 'package:test/test.dart';

void main() {
  group('Storage', () {
    test('can be instantiated', () {
      expect(Storage(), isNotNull);
    });
  });
}
