import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/like_post_use_case.dart';

part 'like_post_state.dart';

@injectable
class LikePostCubit extends Cubit<LikePostState> {
  LikePostCubit(
    this._likePostUseCase,
  ) : super(LikePostInitial());

  final LikePostUseCase _likePostUseCase;
  static LikePostCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> likePost({
    required String postId,
    required bool like,
    required bool isWomen,
  }) async {
    emit(LikePostLoadingState(like));
    (await _likePostUseCase(
      like: like,
      isWomen: isWomen,
      postId: postId,
    ))
        .fold(
      (l) => emit(LikePostErrorState(
        errorMessage: l.message,
        isLike: like,
      )),
      (r) => emit(
        LikePostSuccessState(like),
      ),
    );
  }
}
