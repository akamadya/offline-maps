import 'dart:async';
import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtep_flutter/app/app.dart';
import 'package:gtep_flutter/app/locator.dart';

class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  F.flavor = Flavor.dev;

  await setUpLocator();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runnerApp());
  // await runZonedGuarded(
  //   () async => ),
  //   (error, stackTrace) => error.recordError(stackTrace: stackTrace),
  // );
}

void runnerApp() {
  Bloc.observer = AppBlocObserver();
  HttpOverrides.global = DevHttpOverrides();

  runApp(const App());
  // runZonedGuarded(
  //   () => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //       .then((value) => runApp(const App())),
  //   (error, stackTrace) => error.recordError(stackTrace: stackTrace),
  // );
}
