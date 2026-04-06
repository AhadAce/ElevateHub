part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final UserModel userModel;
  LoginSuccessState({required this.userModel});
}

class LoginErrorState extends AuthState {
  final String errorMessage;

  LoginErrorState({required this.errorMessage});
}

class VerifyOtpLoadingState extends AuthState {}

class VerifyOtpSuccessState extends AuthState {}

class VerifyOtpErrorState extends AuthState {
  final String errorMessage;

  VerifyOtpErrorState({required this.errorMessage});
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final UserModel userModel;
  RegisterSuccessState({required this.userModel});
}

class RegisterErrorState extends AuthState {
  final String errorMessage;

  RegisterErrorState({required this.errorMessage});
}

class ResendOtpLoadingState extends AuthState {}

class ResendOtpSuccessState extends AuthState {}

class ResendOtpErrorState extends AuthState {
  final String errorMessage;

  ResendOtpErrorState({required this.errorMessage});
}

class DeleteFcmLoadingState extends AuthState {}

class DeleteFcmSuccessState extends AuthState {}

class DeleteFcmErrorState extends AuthState {
  final String errorMessage;

  DeleteFcmErrorState({required this.errorMessage});
}
