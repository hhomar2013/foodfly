part of 'sign_up_cubit.dart';

sealed class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpError extends SignUpState {
  final String error;
  SignUpError({required this.error});
}

class SignUpChangePasswordVisibility extends SignUpState {}

class SignUpChangeConfirmPasswordVisibility extends SignUpState {}
