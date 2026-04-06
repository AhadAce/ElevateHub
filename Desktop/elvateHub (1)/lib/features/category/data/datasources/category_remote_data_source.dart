import 'package:elvateHub/core/global_model/filter_model.dart';
import 'package:injectable/injectable.dart';
import 'package:elvateHub/core/helpers/firebase_helper.dart';
import 'package:elvateHub/core/helpers/string_constant.dart';
import 'package:elvateHub/core/network/failure.dart';

import '../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories({
    required bool needUploadFile,
  });
  Future<bool> createNewCategory({
    required CategoryModel categoryModel,
  });
}

@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  @override
  Future<bool> createNewCategory({
    required CategoryModel categoryModel,
  }) async {
    try {
      await FirebaseHelper.postData(
        collection: categoriesCollection,
        data: categoryModel.toJson(),
      );
      return true;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<CategoryModel>> getCategories({
    required bool needUploadFile,
  }) async {
    try {
      final response = await FirebaseHelper.getData(
          collection: categoriesCollection,
          filters: [
            if (!needUploadFile)
              FilterModel(
                field: 'needUploadFile',
                value: false,
                type: FilterType.equals,
              ),
          ]);
      List<CategoryModel> list = [];
      for (var e in response.docs) {
        list.add(CategoryModel.fromJson(json: e.data()));
      }
      return list;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
