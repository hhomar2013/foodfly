import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Core/Network/locale/shared_prefrence.dart';
import 'package:foodfly/Feature/authentication/login/presentation/screen/login_screen.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  int currentIndex = 0;
  late List<Widget> pages = [
    Positioned(
      top: 114,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManagement.orange,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),

    Container(color: ColorManagement.darkBlue),
    Container(color: ColorManagement.red),
  ];

  void changePage(int index) {
    currentIndex = index;
    emit(OnboardingSuccess());
  }

  void goToLoginScreen(BuildContext context) {
    SharedPreference.saveString(key: 'onBoarding', value: 'true');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
