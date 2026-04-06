import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../entities/category_entity.dart';
import '../repositories/category_repo.dart';

@injectable
class GetCategoriesUseCase {
  final CategoryRepo _categoryRepo;
  const GetCategoriesUseCase(
    this._categoryRepo,
  );

  Future<Either<ServerFailure, List<CategoryEntity>>> call({
    required bool needUploadFile,
  }) async {
    return await _categoryRepo.getCategories(
      needUploadFile: needUploadFile,
    );
  }
}
