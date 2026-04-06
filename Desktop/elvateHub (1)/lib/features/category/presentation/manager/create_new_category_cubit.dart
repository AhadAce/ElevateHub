import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:elvateHub/features/category/data/models/category_model.dart';

import '../../domain/usecases/create_new_category_use_case.dart';

part 'create_new_category_state.dart';

@injectable
class CreateNewCategoryCubit extends Cubit<CreateNewCategoryState> {
  CreateNewCategoryCubit(
    this._createNewCategoryUseCase,
  ) : super(CreateNewCategoryInitial());

  final CreateNewCategoryUseCase _createNewCategoryUseCase;
  static CreateNewCategoryCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> createNewCategory({
    required CategoryModel categoryModel,
  }) async {
    emit(CreateNewCategoryLoadingState());
    (await _createNewCategoryUseCase(categoryModel: categoryModel)).fold(
      (l) => emit(CreateNewCategoryErrorState(errorMessage: l.message)),
      (r) => emit(
        CreateNewCategorySuccessState(),
      ),
    );
  }
}
