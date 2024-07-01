import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('/config', () {
    test('test flavor dev running or not', () {
      // arrange
      const flavor = Flavor.dev;

      // actual
      F.flavor = Flavor.dev;

      expect(F.flavor, flavor);
    });
    test('test flavor stag running or not', () {
      // arrange
      const flavor = Flavor.stag;

      // actual
      F.flavor = Flavor.stag;

      expect(F.flavor, flavor);
    });

    test('test flavor prod running or not', () {
      // arrange
      const flavor = Flavor.prod;

      // actual
      F.flavor = Flavor.prod;

      expect(F.flavor, flavor);
    });
  });
}
