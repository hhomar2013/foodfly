import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPassword = false;
  bool isConfirmPassword = false;
  IconData suffixIcon = Icons.visibility_off;
  IconData suffixIconConfirmPassword = Icons.visibility_off;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(SignUpChangePasswordVisibility());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPassword = !isConfirmPassword;
    suffixIconConfirmPassword = isConfirmPassword
        ? Icons.visibility_off
        : Icons.visibility;
    emit(SignUpChangeConfirmPasswordVisibility());
  }
}
