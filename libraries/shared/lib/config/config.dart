import 'package:core/core.dart';

import 'package:shared/shared.dart';

export 'constant.dart';
export 'named_routes.dart';

class AppConfig {
  static const String appName = 'OPTIMA';
  static const baseTheme = AppTheme.light;
  static FlavorConfig<String> baseUrl = FlavorConfig<String>(
    dev: baseUrlDev,
    prod: baseUrlProd,
    staging: baseUrlStag,
  );
}
