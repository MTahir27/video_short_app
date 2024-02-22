import 'package:flutter/material.dart';

import '../helper/page_navigate.dart';
import '../router/routing_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      pushNamedAndRemoveUntilNavigate(
        context: context,
        pageName: frontendScreenRoute,
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
