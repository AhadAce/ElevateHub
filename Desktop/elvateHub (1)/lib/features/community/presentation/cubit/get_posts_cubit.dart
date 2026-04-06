import 'package:elvateHub/features/community/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_posts_use_case.dart';

part 'get_posts_state.dart';

@injectable
class GetPostsCubit extends Cubit<GetPostsState> {
  GetPostsCubit(
    this._createNewPostUseCase,
  ) : super(GetPostsInitial());

  final GetPostsUseCase _createNewPostUseCase;
  static GetPostsCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getPosts({
    String? categoryId,
    required bool isWomen,
  }) async {
    emit(GetPostsLoadingState());
    (await _createNewPostUseCase(
      categoryId: categoryId,
      isWomen: isWomen,
    ))
        .fold(
      (l) => emit(GetPostsErrorState(errorMessage: l.message)),
      (r) => emit(
        GetPostsSuccessState(r),
      ),
    );
  }
}
