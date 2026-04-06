import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_loading_widget.dart';
import 'package:elvateHub/core/widgets/error_state_widget.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/category/presentation/manager/get_category_cubit.dart';
import 'package:elvateHub/features/community/presentation/cubit/community_var_cubit.dart';
import 'package:elvateHub/features/community/presentation/cubit/get_posts_cubit.dart';
import 'package:elvateHub/features/community/presentation/widgets/post_card_widget.dart';

import '../widgets/category_card_widget.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({
    super.key,
    required this.isWomen,
  });
  final bool isWomen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          AppRouter.createNewPost,
          arguments: isWomen,
        ),
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        child: Icon(
          Icons.edit,
          color: AppColors.primaryDarkColor,
        ),
      ),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  S.of(context).elevetHubCommunity,
                  style: context.mainTitle,
                ),
              ),
              const VerticalSizedBox(20),
              BlocBuilder<GetCategoryCubit, GetCategoriesState>(
                builder: (context, state) => state is GetCategoriesSuccessState
                    ? Container(
                        decoration: BoxDecoration(
                          color: context.primaryColor,
                        ),
                        height: 50.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CategoryCardWidget(
                            categoryEntity: state.categories[index],
                            isWomen: isWomen,
                          ),
                          separatorBuilder: (context, index) =>
                              const HorizontalSizedBox(10),
                          itemCount: state.categories.length,
                        ),
                      )
                    : const SizedBox(),
              ),
              const VerticalSizedBox(20),
              BlocBuilder<GetPostsCubit, GetPostsState>(
                  builder: (context, state) {
                if (state is GetPostsSuccessState) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => PostCardWidget(
                      postEntity: state.posts[index],
                      isWomen: isWomen,
                    ),
                    separatorBuilder: (context, index) =>
                        const VerticalSizedBox(10),
                    itemCount: state.posts.length,
                  );
                } else if (state is GetPostsErrorState) {
                  return ErrorStateWidget(
                    error: state.errorMessage,
                    function: () => GetPostsCubit.get(context).getPosts(
                      categoryId:
                          CommunityVarCubit.get(context).categoryId.isEmpty
                              ? null
                              : CommunityVarCubit.get(context).categoryId,
                      isWomen: isWomen,
                    ),
                  );
                } else {
                  return const CustomLoadingWidget();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
