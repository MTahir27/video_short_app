import 'package:flutter/material.dart';
import 'package:video_short/screens/page_not_found_screen.dart';

import '../screens/onborading_screen.dart';
import './routing_constants.dart';
import '../screens/frontend_screen.dart';
import '../screens/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // Splash Screen
    case splashScreenRoute:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
    case frontendScreenRoute:
      return MaterialPageRoute(
        builder: (_) => const FrontendScreen(),
      );
    case onboardingScreenRoute:
      return MaterialPageRoute(
        builder: (_) => const OnboardingScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const PageNotFoundScreen(),
      );
  }
}
