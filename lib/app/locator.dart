// ignore_for_file: cascade_invocations

import 'dart:io';

import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:gtep_flutter/firebase_options.dart';
import 'package:hive/hive.dart';
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:settings/settings.dart';
import 'package:shared/shared.dart';
import 'package:shared/utils/utlis.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setUpLocator({Flavor? flavor = Flavor.prod}) async {
  await _setUpCore();

  /* -------------------------SETTINGS START-------------------------- */
  // data
  getIt.registerLazySingleton<RemoteSettings>(
    () => RemoteSettingsImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(getIt(), getIt()),
  );

  // domain
  getIt.registerLazySingleton(() => GetDataSettingsUseCase(getIt()));
  getIt.registerLazySingleton(() => SetFlavorUseCase(getIt()));
  getIt.registerLazySingleton(() => SetLanguageUseCase(getIt()));
  getIt.registerLazySingleton(() => SetThemeUseCase(getIt()));
  getIt.registerLazySingleton(() => SettingsUsecaseImpl(getIt()));

  // presentation
  getIt.registerFactory(
    () => SettingsBloc(
      getDataSettingsUseCase: getIt(),
      setFlavorUseCase: getIt(),
      setThemeUseCase: getIt(),
      setLanguageUseCase: getIt(),
    ),
  );
  getIt.registerFactory(LanguageBloc.new);
  getIt.registerFactory(() => DeleteAccountBloc(getIt()));

  /* --------------------------SETTINGS END--------------------------- */

  /* ---------------------------AUTH START--------------------------- */
  // data
  getIt.registerLazySingleton<RemoteAuth>(
    () => RemoteAuthImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<LocalAuth>(() => LocalAuthImpl(getIt()));

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt(), getIt()),
  );

  // domain=
  getIt.registerLazySingleton(() => AuthUseCaseImpl(getIt()));

  // presentation
  getIt.registerFactory(() => AuthBloc(getIt()));
  getIt.registerFactory(() => SignInBloc(getIt()));
  getIt.registerFactory(() => LogoutBloc(getIt()));

  /* ----------------------------AUTH END---------------------------- */

  getIt.registerLazySingleton(RecordErrorUseCase.new);
}

Future<void> _setUpCore() async {
  //if (Platform.isAndroid) {
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppNotification.init();
  //}

  final preferences = await SharedPreferences.getInstance();
  //final packageInfo = await PackageInfo.fromPlatform();

  // getIt
  //     .registerLazySingleton<AppPackageInfo>(() => AppPackageInfo(packageInfo));
  getIt.registerLazySingleton<Dio>(
    () => Dio()
      ..options = BaseOptions(
        baseUrl: AppConfig.baseUrl.value,
      )
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (object) {
          AppLogger(appName: 'DioLOCATOR').print(
            object.toString(),
          );
        },
      )),
  );
  getIt.registerLazySingleton(() => preferences);
  getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(getIt()));

  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init('${appDocDir.path}/db');
  }

  getIt.registerLazySingleton<HiveInterface>(() => Hive);

  getIt.registerLazySingleton<LocationHelper>(LocationHelper.new);
}
