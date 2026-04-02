import 'package:flutter/material.dart';
import 'package:tminus1/core/routing/routes.dart';
import 'package:tminus1/features/auth/auth_screen.dart';
import 'package:tminus1/features/home/presentation/ui/home_screen.dart';
import 'package:tminus1/features/main_layout.dart';
import 'package:tminus1/features/onboarding/onboarding_screen.dart';
import 'package:tminus1/features/settings/settings_screen.dart';

import '../../features/splash_screen.dart';

class AppRouter {
  const AppRouter._();

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
          settings: settings,
        );
      case Routes.auth:
        return MaterialPageRoute(
          builder: (_) => AuthScreen(),
          settings: settings,
        );
      case Routes.mainLayout:
        return MaterialPageRoute(
          builder: (_) => MainLayout(),
          settings: settings,
        );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('No Route Found'))),
          settings: settings,
        );
    }
  }
}
