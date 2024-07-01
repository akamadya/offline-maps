// ignore_for_file: unused_element

import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:gtep_flutter/app/locator.dart';
import 'package:gtep_flutter/app/routes.dart';
import 'package:settings/settings.dart';
import 'package:shared/shared.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const _App();
  }
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.I<SettingsBloc>()..add(GetSettingsEvent()),
        ),
        BlocProvider(
          create: (_) => GetIt.I<LanguageBloc>()..add(GetSupportedLanguages()),
        ),
        BlocProvider(create: (_) => GetIt.I<AuthBloc>()..add(GetAuthStatus())),
        BlocProvider(create: (_) => GetIt.I<SignInBloc>()),
        BlocProvider(create: (_) => GetIt.I<LogoutBloc>()),
      ],
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listenWhen: (oldState, newState) {
        return oldState.settings.flavor != newState.settings.flavor;
      },
      listener: (context, state) {
        GetIt.I.reset(dispose: false);
        setUpLocator(flavor: state.settings.flavor);
      },
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: state.settings.language?.toLocale(),
            debugShowCheckedModeBanner: false,
            title: AppConfig.appName,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: state.settings.appTheme?.toTheme().data,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
