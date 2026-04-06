import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/splash_screen.dart';

class Foodfly extends StatelessWidget {
  const Foodfly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodfly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        textTheme: GoogleFonts.senTextTheme(),
      ),
      home: SplashScreen(),
    );
  }
}
