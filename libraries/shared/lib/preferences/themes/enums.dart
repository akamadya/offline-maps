import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:shared/shared.dart';

enum AppTheme {
  @JsonValue('light')
  light,
  @JsonValue('dark')
  dark
}

extension AppThemeX on AppTheme {
  String toText() {
    return describeEnum(this);
  }

  BaseTheme toTheme() {
    switch (this) {
      case AppTheme.dark:
        return DarkTheme(AppColors.primary);
      case AppTheme.light:
        return LightTheme(AppColors.primary);
    }
  }
}
