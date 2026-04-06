part of 'get_category_cubit.dart';

abstract class GetCategoriesState {}

class GetCategoriesInitial extends GetCategoriesState {}

class GetCategoriesLoadingState extends GetCategoriesState {}

class GetCategoriesSuccessState extends GetCategoriesState {
  final List<CategoryEntity> categories;

  GetCategoriesSuccessState({required this.categories});
}

class GetCategoriesErrorState extends GetCategoriesState {
  final String errorMessage;

  GetCategoriesErrorState({required this.errorMessage});
}
