import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Feature/onBoarding/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManagement.orange,
      body: Center(child: Image.asset('assets/images/Foodfly.gif' )),
    );
  }
}
