import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart';

void main() {
  group('preferences/themes', () {
    const tDark = AppTheme.dark;
    const tLight = AppTheme.light;

    test('Should get name enum in String correctly', () {
      expect(tDark.toText(), 'dark');
      expect(tLight.toText(), 'light');
    });

    test('Should convert from AppTheme enum to ThemeData', () {
      expect(tDark.toTheme(), isA<BaseTheme>());
      expect(tLight.toTheme(), isA<BaseTheme>());

      expect(tDark.toTheme().data.primaryColor, AppColors.primary);
      expect(tLight.toTheme().data.primaryColor, AppColors.primary);
    });

    test('Should convert from String To AppTheme enum', () {
      expect(tDark, 'dark'.toAppTheme());
      expect(tLight, 'light'.toAppTheme());
    });
  });
}
