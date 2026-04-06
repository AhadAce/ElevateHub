import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/title%20_text_field_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/category/presentation/manager/get_category_cubit.dart';
import 'package:elvateHub/features/job/presentation/cubit/job_var_cubit.dart';
import 'package:elvateHub/features/job/presentation/widgets/category_card_widget.dart';

class SearchJobScreen extends StatefulWidget {
  const SearchJobScreen({super.key});

  @override
  State<SearchJobScreen> createState() => _SearchJobScreenState();
}

class _SearchJobScreenState extends State<SearchJobScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleTextFieldWidget(
                hint: S.of(context).search,
                controller: _searchController,
                title: S.of(context).search,
              ),
              const VerticalSizedBox(20),
              Text(
                S.of(context).selectCategory,
                style: context.subBody,
              ),
              const VerticalSizedBox(10),
              BlocBuilder<GetCategoryCubit, GetCategoriesState>(
                builder: (context, state) => Wrap(
                  children: state is GetCategoriesSuccessState
                      ? state.categories
                          .map(
                            (element) => JobCategoryCardWidget(
                              categoryEntity: element,
                            ),
                          )
                          .toList()
                      : [],
                ),
              ),
              const VerticalSizedBox(20),
              AppBtn(
                title: S.of(context).applyFilters,
                function: () => Navigator.pushNamed(
                  context,
                  AppRouter.searchResultJob,
                  arguments: {
                    'categoryId': JobVarCubit.get(context).categoryId,
                    'search': _searchController.text,
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
