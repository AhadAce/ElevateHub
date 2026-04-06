import 'package:injectable/injectable.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/features/category/domain/usecases/get_categories_use_case.dart';
import 'package:elvateHub/my_app.dart';

import '../../domain/entities/category_entity.dart';

part 'get_category_state.dart';

@injectable
class GetCategoryCubit extends Cubit<GetCategoriesState> {
  GetCategoryCubit(
    this._authUseCase,
  ) : super(GetCategoriesInitial());

  final GetCategoriesUseCase _authUseCase;
  static GetCategoryCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getCategories({
    bool needShowAll = false,
    required bool needUploadFile,
  }) async {
    emit(GetCategoriesLoadingState());
    (await _authUseCase(
      needUploadFile: needUploadFile,
    ))
        .fold((l) => emit(GetCategoriesErrorState(errorMessage: l.message)),
            (r) {
      if (needShowAll) {
        r.insert(
          0,
          CategoryEntity(
            id: '',
            flag: '',
            name: navigatorKey.currentContext == null
                ? 'All'
                : S.of(navigatorKey.currentContext!).all,
            needUploadFile: false,
          ),
        );
      }
      emit(GetCategoriesSuccessState(categories: r));
    });
  }
}
