import 'package:flutter/material.dart';

import './config/palette.dart';
import './router/routing_constants.dart';
import './screens/splash_screen.dart';
import './screens/page_not_found_screen.dart';

import 'router/router.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Pallete.primaryColor),
          primarySwatch: Pallete.primaryColor,
          useMaterial3: true,
          fontFamily: 'Urbanist',
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            headlineMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            headlineSmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            bodySmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          )),
      initialRoute: splashScreenRoute,
      home: const SplashScreen(),
      onGenerateRoute: router.generateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const PageNotFoundScreen(),
      ),
    );
  }
}
