part of 'comment_post_cubit.dart';

abstract class CommentPostState {}

class CommentPostInitial extends CommentPostState {}

class CommentPostLoadingState extends CommentPostState {}

class CommentPostSuccessState extends CommentPostState {
  final String comment;
  CommentPostSuccessState(this.comment);
}

class CommentPostErrorState extends CommentPostState {
  final String errorMessage;

  CommentPostErrorState({required this.errorMessage});
}
