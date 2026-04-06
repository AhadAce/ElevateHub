import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:elvateHub/features/category/data/models/category_model.dart';

import '../../../../core/network/failure.dart';
import '../repositories/category_repo.dart';

@injectable
class CreateNewCategoryUseCase {
  final CategoryRepo _categoryRepo;
  const CreateNewCategoryUseCase(
    this._categoryRepo,
  );

  Future<Either<ServerFailure, bool>> call({
    required CategoryModel categoryModel,
  }) async {
    return await _categoryRepo.createNewCategory(
      categoryModel: categoryModel,
    );
  }
}
