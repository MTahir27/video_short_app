import 'package:flutter/material.dart';
import 'package:video_short/helper/page_navigate.dart';
import 'package:video_short/router/routing_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      pushNamedAndRemoveUntilNavigate(
        context: context,
        pageName: onboardingScreenRoute,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/splash/splash_bg.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
