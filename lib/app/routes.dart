import 'package:auth/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:main/main.dart';
import 'package:settings/settings.dart';
import 'package:shared/shared.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    // GoRoute(
    //   path: NamedRoutes.initial,
    //   builder: (context, state) => const MainPage(),
    // ),
    GoRoute(
      path: NamedRoutes.initial,
      builder: (context, state) => const CoalPage(),
    ),
    GoRoute(
      path: NamedRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),

    //AUTH
    GoRoute(
      path: NamedRoutes.forgotPass,
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: NamedRoutes.successForgotPass,
      builder: (context, state) => const SuccessForgotPasswordPage(),
    ),

    // Main
    // GoRoute(
    //   path: NamedRoutes.mainPage,
    //   builder: (context, state) => const MainPage(),
    // ),
  ],
);
