import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Feature/authentication/login/presentation/screen/login_screen.dart';
import 'package:foodfly/Feature/onBoarding/cubit/onboarding_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final cubit = context.read<OnboardingCubit>();
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: PageView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(color: ColorManagement.white),
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 114,
                                  bottom: 114,
                                  left: 67,
                                  right: 67,
                                  child: Container(
                                    height: double.infinity,
                                    width: 240,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: ColorManagement.darkBlue,
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/Foodfly2.gif',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'All your favorites',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManagement.darkBlue,
                                ),
                              ),
                              SizedBox(height: 25),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text(
                                  'Get all your loved foods in one once place ,\n you just place the orer we do the rest',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  onPageChanged: (value) => cubit.changePage(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                child: PageViewDotIndicator(
                  currentItem: cubit.currentIndex,
                  count: cubit.pages.length,
                  unselectedColor: ColorManagement.orangeAccent,
                  selectedColor: ColorManagement.orange,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 62,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.currentIndex == cubit.pages.length - 1
                                ? cubit.goToLoginScreen(context)
                                : cubit.changePage(cubit.currentIndex + 1);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManagement.orange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: cubit.currentIndex == cubit.pages.length - 1
                              ? Text("Get Started")
                              : Text("Next"),
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () => cubit.goToLoginScreen(context),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorManagement.gray,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
