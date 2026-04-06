part of 'create_new_category_cubit.dart';

abstract class CreateNewCategoryState {}

class CreateNewCategoryInitial extends CreateNewCategoryState {}

class CreateNewCategoryLoadingState extends CreateNewCategoryState {}

class CreateNewCategorySuccessState extends CreateNewCategoryState {
  CreateNewCategorySuccessState();
}

class CreateNewCategoryErrorState extends CreateNewCategoryState {
  final String errorMessage;

  CreateNewCategoryErrorState({required this.errorMessage});
}
