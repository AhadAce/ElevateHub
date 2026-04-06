import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/comment_post_use_case.dart';

part 'comment_post_state.dart';

@injectable
class CommentPostCubit extends Cubit<CommentPostState> {
  CommentPostCubit(
    this._commentPostUseCase,
  ) : super(CommentPostInitial());

  final CommentPostUseCase _commentPostUseCase;
  static CommentPostCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> commentPost({
    required String postId,
    required String comment,
    required String userId,
    required String name,
    required String image,
    required bool isWomen,
  }) async {
    emit(CommentPostLoadingState());
    (await _commentPostUseCase(
      postId: postId,
      isWomen: isWomen,
      comment: comment,
      userId: userId,
      name: name,
      image: image,
    ))
        .fold(
      (l) => emit(CommentPostErrorState(errorMessage: l.message)),
      (r) => emit(
        CommentPostSuccessState(comment),
      ),
    );
  }
}
