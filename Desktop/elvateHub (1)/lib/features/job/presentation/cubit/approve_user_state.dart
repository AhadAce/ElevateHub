part of 'approve_user_cubit.dart';

abstract class ApproveUserState {}

class ApproveUserInitial extends ApproveUserState {}

class ApproveUserLoadingState extends ApproveUserState {
  ApproveUserLoadingState();
}

class ApproveUserSuccessState extends ApproveUserState {
  ApproveUserSuccessState();
}

class ApproveUserErrorState extends ApproveUserState {
  final String errorMessage;

  ApproveUserErrorState({
    required this.errorMessage,
  });
}
