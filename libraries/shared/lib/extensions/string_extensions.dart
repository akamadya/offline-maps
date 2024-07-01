import 'package:shared/shared.dart';

extension StringX on String {
  AppTheme toAppTheme() {
    final appTheme =
    AppTheme.values.firstWhere((e) => e.toString() == 'AppTheme.$this');
    return appTheme;
  }
}
