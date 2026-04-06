part of 'create_mentorship_cubit.dart';

abstract class CreateMentorshipState {}

class CreateMentorshipInitial extends CreateMentorshipState {}

class CreateMentorshipLoadingState extends CreateMentorshipState {}

class CreateMentorshipSuccessState extends CreateMentorshipState {
  CreateMentorshipSuccessState();
}

class CreateMentorshipErrorState extends CreateMentorshipState {
  final String errorMessage;

  CreateMentorshipErrorState({required this.errorMessage});
}
