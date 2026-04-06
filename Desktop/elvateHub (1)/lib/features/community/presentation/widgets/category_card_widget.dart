import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/features/category/domain/entities/category_entity.dart';
import 'package:elvateHub/features/community/presentation/cubit/community_var_cubit.dart';
import 'package:elvateHub/features/community/presentation/cubit/get_posts_cubit.dart';

import '../cubit/community_var_state.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.categoryEntity,
    required this.isWomen,
  });
  final CategoryEntity categoryEntity;
  final bool isWomen;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityVarCubit, CommunityVarState>(
      listener: (context, state) {
        if (state is CommunityVarChangeTabState) {}
      },
      builder: (context, state) {
        bool isCurrentCategory =
            CommunityVarCubit.get(context).categoryId == categoryEntity.id;
        return GestureDetector(
          onTap: isCurrentCategory
              ? null
              : () {
                  CommunityVarCubit.get(context)
                      .changeCategory(categoryEntity.id ?? '');
                  GetPostsCubit.get(context).getPosts(
                    categoryId: (categoryEntity.id?.isEmpty ?? true)
                        ? null
                        : categoryEntity.id,
                    isWomen: isWomen,
                  );
                },
          child: Container(
            decoration: BoxDecoration(
              color: isCurrentCategory
                  ? context.scaffoldColor
                  : AppColors.primaryDarkColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Center(
              child: Text(
                categoryEntity.name ?? '',
                style: context.subBody!.copyWith(
                  color: isCurrentCategory
                      ? AppColors.primaryDarkColor
                      : context.scaffoldColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
