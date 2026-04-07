import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPassword = false;
  bool isRememberMe = false;
  IconData suffixIcon = Icons.visibility_off;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(LoginChangePasswordVisibility());
  }

  void changeRememberMe() {
    isRememberMe = !isRememberMe;
    emit(LoginChangeRememberMe());
  }
}
