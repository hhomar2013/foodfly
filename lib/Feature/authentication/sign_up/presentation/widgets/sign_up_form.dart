import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Core/components/components.dart';
import 'package:foodfly/Feature/authentication/login/presentation/screen/login_screen.dart';
import 'package:foodfly/Feature/authentication/sign_up/logic/cubit/sign_up_cubit.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<SignUpCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              defaultLabel(text: 'Name'),
              defaultTextField(
                controller: cubit.nameController,
                type: TextInputType.text,
                hintText: 'Name',
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Name must not be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              defaultLabel(text: 'Email'),
              defaultTextField(
                controller: cubit.emailController,
                type: TextInputType.emailAddress,
                hintText: 'Email',
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Email must not be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              defaultLabel(text: 'Password'),
              defaultTextField(
                controller: cubit.passwordController,
                type: TextInputType.visiblePassword,
                hintText: 'Password',
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
              SizedBox(height: 10),
              defaultLabel(text: 'Confirm Password'),
              defaultTextField(
                controller: cubit.confirmPasswordController,
                type: TextInputType.visiblePassword,
                hintText: 'Confirm Password',
                isPassword: !cubit.isConfirmPassword,
                suffix: cubit.isConfirmPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                suffixPressed: () => cubit.changeConfirmPasswordVisibility(),
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Confirm Password must not be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              defaultButton(text: 'Sign Up', function: () {}),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorManagement.darkBlue,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      navigateAndFinish(context, LoginScreen());
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorManagement.orange,
                      ),
                    ),
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
