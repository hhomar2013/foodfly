import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Core/Network/locale/shared_prefrence.dart';
import 'package:foodfly/Feature/authentication/login/presentation/screen/login_screen.dart';
import 'package:foodfly/Feature/onBoarding/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String? onBoarding = SharedPreference.getString(key: 'onBoarding');
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              onBoarding == 'true' ? LoginScreen() : OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManagement.white,
      body: Center(child: Image.asset('assets/images/Foodfly1.gif')),
    );
  }
}
