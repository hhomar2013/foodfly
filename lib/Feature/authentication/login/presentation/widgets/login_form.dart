import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Core/components/components.dart';
import 'package:foodfly/Feature/authentication/forgot_password/screen/forgot_password_screen.dart';
import 'package:foodfly/Feature/authentication/login/logic/cubit/login_cubit.dart';
import 'package:foodfly/Feature/authentication/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:foodfly/Feature/home/presentation/screens/home_v1_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: ColorManagement.darkBlue,
                  ),
                ),
              ),
              defaultTextField(
                controller: cubit.emailController,
                type: TextInputType.emailAddress,
                hintText: 'example@mail.com',
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Email must not be empty';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorManagement.darkBlue,
                  ),
                ),
              ),
              defaultTextField(
                controller: cubit.passwordController,
                type: TextInputType.visiblePassword,
                hintText: '********',
                isPassword: !cubit.isPassword,
                suffix: cubit.isPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                suffixPressed: () => cubit.changePasswordVisibility(),
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Password must not be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  defaultCheckBox(
                    value: cubit.isRememberMe,
                    text: 'Remember me',
                    onChanged: (value) {
                      cubit.changeRememberMe();
                    },
                    activeColor: ColorManagement.orange,
                    checkColor: ColorManagement.white,
                  ),
                  TextButton(
                    onPressed: () {
                      navigateTo(context, ForgotPasswordScreen());
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorManagement.orange,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              defaultButton(
                text: 'LOG IN',
                function: () {
                  navigateAndFinish(context, HomeV1Screen());
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorManagement.darkBlue,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      navigateTo(context, SignUpScreen());
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorManagement.orange,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  'Or',
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorManagement.darkBlue,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManagement.white,
                    ),
                    child: Icon(
                      Icons.facebook,
                      color: ColorManagement.darkBlue,
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManagement.white,
                    ),
                    child: Icon(Icons.apple, color: ColorManagement.darkBlue),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
