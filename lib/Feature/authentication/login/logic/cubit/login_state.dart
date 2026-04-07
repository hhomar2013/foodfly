part of 'login_cubit.dart';

sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}

class LoginChangePasswordVisibility extends LoginState {}

class LoginChangeRememberMe extends LoginState {}
