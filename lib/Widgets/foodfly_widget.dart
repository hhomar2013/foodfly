import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodfly/Core/util/size_config.dart';
import 'package:foodfly/Feature/home/logic/cubit/cart_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/splash_screen.dart';

class Foodfly extends StatelessWidget {

  const Foodfly({super.key});

  @override
  Widget build(BuildContext context) {
  
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        title: 'Foodfly',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.light(),
          textTheme: GoogleFonts.senTextTheme(),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
