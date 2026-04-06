part of 'get_mentorship_cubit.dart';

abstract class GetMentorshipState {}

class GetMentorshipInitial extends GetMentorshipState {}

class GetMentorshipLoadingState extends GetMentorshipState {}

class GetMentorshipSuccessState extends GetMentorshipState {
  List<MentorshipEntity> success;
  GetMentorshipSuccessState(this.success);
}

class GetMentorshipErrorState extends GetMentorshipState {
  final String errorMessage;

  GetMentorshipErrorState({required this.errorMessage});
}
