import 'package:flutter/material.dart';
import 'package:video_short/screens/page_not_found_screen.dart';

import './routing_constants.dart';
import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // Splash Screen
    case splashScreenRoute:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
    case homeScreenRoute:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const PageNotFoundScreen(),
      );
  }
}
