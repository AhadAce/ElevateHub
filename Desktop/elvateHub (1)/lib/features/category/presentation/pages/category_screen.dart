import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_loading_widget.dart';
import 'package:elvateHub/core/widgets/error_state_widget.dart';
import 'package:elvateHub/features/category/presentation/manager/get_category_cubit.dart';
import 'package:elvateHub/features/category/presentation/widgets/category_card_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    GetCategoryCubit.get(context).getCategories(
      needUploadFile: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetCategoryCubit, GetCategoriesState>(
          builder: (context, state) {
        if (state is GetCategoriesSuccessState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                state.categories.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            S.of(context).categoryIsEmpty,
                            style: context.subBody,
                          ),
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) => CategoryCardWidget(
                            categoryEntity: state.categories[index],
                          ),
                        ),
                      ),
                if (isAdmin()) ...[
                  // AppBtn(
                  //   title: S.of(context).createNewCategory,
                  //   function: () => Navigator.pushNamed(
                  //     context,
                  //     AppRouter.createNewCategory,
                  //   ),
                  // ),
                ],
              ],
            ),
          );
        } else if (state is GetCategoriesErrorState) {
          return ErrorStateWidget(
            error: state.errorMessage,
            function: () => GetCategoryCubit.get(context).getCategories(
              needUploadFile: true,
            ),
          );
        } else {
          return const CustomLoadingWidget();
        }
      }),
    );
  }
}
