import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/features/category/domain/entities/category_entity.dart';
import '../cubit/job_var_cubit.dart';
import '../cubit/job_var_state.dart';

class JobCategoryCardWidget extends StatelessWidget {
  const JobCategoryCardWidget({
    super.key,
    required this.categoryEntity,
  });
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobVarCubit, JobVarState>(
      listener: (context, state) {
        if (state is JobVarChangeTabState) {}
      },
      builder: (context, state) {
        bool isCurrentCategory =
            JobVarCubit.get(context).categoryId == categoryEntity.id;
        return GestureDetector(
          onTap: isCurrentCategory
              ? null
              : () {
                  JobVarCubit.get(context)
                      .changeCategory(categoryEntity.id ?? '');
                },
          child: Container(
            decoration: BoxDecoration(
              color: isCurrentCategory
                  ? AppColors.primaryDarkColor
                  : context.scaffoldColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            width: 100.w,
            // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Center(
              child: Text(
                categoryEntity.name ?? '',
                style: context.subBody!.copyWith(
                  color: isCurrentCategory
                      ? context.scaffoldColor
                      : AppColors.primaryDarkColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
