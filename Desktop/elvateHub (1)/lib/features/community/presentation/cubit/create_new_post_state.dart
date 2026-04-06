part of 'create_new_post_cubit.dart';

abstract class CreateNewPostState {}

class CreateNewPostInitial extends CreateNewPostState {}

class CreateNewPostLoadingState extends CreateNewPostState {}

class CreateNewPostSuccessState extends CreateNewPostState {
  CreateNewPostSuccessState();
}

class CreateNewPostErrorState extends CreateNewPostState {
  final String errorMessage;

  CreateNewPostErrorState({required this.errorMessage});
}
