import 'package:flutter/material.dart';

import './routing_constants.dart';
import '../screens/splash_screen.dart';
import '../screens/frontend_screen.dart';
import '../screens/onborading_screen.dart';
import '../screens/page_not_found_screen.dart';
import '../screens/product_detail_screen.dart';

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
    case productDetailScreenRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const ProductDetailScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const PageNotFoundScreen(),
      );
  }
}
