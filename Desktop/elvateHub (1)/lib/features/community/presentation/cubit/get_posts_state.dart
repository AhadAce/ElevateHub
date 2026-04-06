part of 'get_posts_cubit.dart';

abstract class GetPostsState {}

class GetPostsInitial extends GetPostsState {}

class GetPostsLoadingState extends GetPostsState {}

class GetPostsSuccessState extends GetPostsState {
  List<PostEntity> posts;
  GetPostsSuccessState(this.posts);
}

class GetPostsErrorState extends GetPostsState {
  final String errorMessage;

  GetPostsErrorState({required this.errorMessage});
}
