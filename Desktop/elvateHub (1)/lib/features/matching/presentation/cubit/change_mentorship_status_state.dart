part of 'change_mentorship_status_cubit.dart';

abstract class ChangeMentorshipStatusState {}

class ChangeMentorshipStatusInitial extends ChangeMentorshipStatusState {}

class ChangeMentorshipStatusLoadingState extends ChangeMentorshipStatusState {}

class ChangeMentorshipStatusSuccessState extends ChangeMentorshipStatusState {
  ChangeMentorshipStatusSuccessState();
}

class ChangeMentorshipStatusErrorState extends ChangeMentorshipStatusState {
  final String errorMessage;

  ChangeMentorshipStatusErrorState({required this.errorMessage});
}
