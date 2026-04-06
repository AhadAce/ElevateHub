import 'package:elvateHub/core/assets/assets.gen.dart';
import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_back_button.dart';
import 'package:elvateHub/core/widgets/custom_loading_widget.dart';
import 'package:elvateHub/core/widgets/error_state_widget.dart';
import 'package:elvateHub/core/widgets/title%20_text_field_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/features/job/presentation/cubit/get_jobs_cubit.dart';
import 'package:elvateHub/features/job/presentation/widgets/custom_pop_menu.dart';
import 'package:elvateHub/features/job/presentation/widgets/job_card_widget.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
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
      floatingActionButton: context.user.type != UserType.user
          ? FloatingActionButton(
              backgroundColor: AppColors.lightPrimaryColor,
              child: Icon(
                Icons.add,
                color: context.primaryColor,
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                AppRouter.createNewJob,
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CustomBackButton(),
                  Spacer(),
                  CustomPopupMenu(),
                ],
              ),
              Text(
                context.user.type == UserType.user
                    ? S.of(context).findJob
                    : S.of(context).manageJob,
                style: context.mainTitle,
              ),
              if (context.user.type == UserType.user) ...[
                const VerticalSizedBox(20),
                TitleTextFieldWidget(
                  prefix: const Icon(
                    Icons.search,
                  ),
                  hint: S.of(context).search,
                  controller: _searchController,
                  onTapFunction: () => Navigator.pushNamed(
                    context,
                    AppRouter.searchJob,
                  ),
                  suffix: Assets.images.filter.svg(),
                ),
                const VerticalSizedBox(20),
                Text(S.of(context).explore),
              ],
              const VerticalSizedBox(10),
              BlocBuilder<GetJobsCubit, GetJobsState>(
                builder: (context, state) {
                  if (state is GetJobsSuccessState) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => JobCardWidget(
                        jobEntity: state.jobs[index],
                      ),
                      shrinkWrap: true,
                      itemCount: state.jobs.length,
                    );
                  } else if (state is GetJobsErrorState) {
                    return ErrorStateWidget(
                      error: state.errorMessage,
                      function: () => GetJobsCubit.get(context).getJobs(),
                    );
                  } else {
                    return const CustomLoadingWidget();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
