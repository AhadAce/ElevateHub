import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/post_model.dart';
import '../../domain/usecases/create_new_post_use_case.dart';

part 'create_new_post_state.dart';

@injectable
class CreateNewPostCubit extends Cubit<CreateNewPostState> {
  CreateNewPostCubit(
    this._createNewPostUseCase,
  ) : super(CreateNewPostInitial());

  final CreateNewPostUseCase _createNewPostUseCase;
  static CreateNewPostCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> createNewPost({
    required PostModel postModel,
    required bool isWomen,
  }) async {
    emit(CreateNewPostLoadingState());
    (await _createNewPostUseCase(
      postModel: postModel,
      isWomen: isWomen,
    ))
        .fold(
      (l) => emit(CreateNewPostErrorState(errorMessage: l.message)),
      (r) => emit(
        CreateNewPostSuccessState(),
      ),
    );
  }
}
