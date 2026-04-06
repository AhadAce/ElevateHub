part of 'get_all_chat_cubit.dart';

abstract class GetAllChatState {}

class GetAllChatInitial extends GetAllChatState {}

class GetAllChatLoadingState extends GetAllChatState {}

class GetAllChatSuccessState extends GetAllChatState {
  final List<MentorshipEntity> chats;

  GetAllChatSuccessState({required this.chats});
}

class GetAllChatErrorState extends GetAllChatState {
  final String errorMessage;

  GetAllChatErrorState({required this.errorMessage});
}
