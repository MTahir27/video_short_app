import 'package:flutter/material.dart';
import 'package:video_short/router/routing_constants.dart';
import 'package:video_short/screens/page_not_found_screen.dart';
import 'package:video_short/screens/splash_screen.dart';

import 'router/router.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: splashScreenRoute,
      home: const SplashScreen(),
      onGenerateRoute: router.generateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const PageNotFoundScreen(),
      ),
    );
  }
}
