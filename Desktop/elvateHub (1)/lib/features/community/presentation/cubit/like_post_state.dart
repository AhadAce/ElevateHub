part of 'like_post_cubit.dart';

abstract class LikePostState {}

class LikePostInitial extends LikePostState {}

class LikePostLoadingState extends LikePostState {
  final bool isLike;
  LikePostLoadingState(this.isLike);
}

class LikePostSuccessState extends LikePostState {
  final bool isLike;

  LikePostSuccessState(this.isLike);
}

class LikePostErrorState extends LikePostState {
  final String errorMessage;
  final bool isLike;

  LikePostErrorState({
    required this.errorMessage,
    required this.isLike,
  });
}
