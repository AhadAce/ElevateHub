import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/features/job/presentation/cubit/get_jobs_cubit.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/vertical_sized_box.dart';
import '../widgets/job_card_widget.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({
    super.key,
    required this.categoryId,
    required this.search,
  });
  final String categoryId, search;
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
              Text(
                S.of(context).Searchresults,
                style: context.mainTitle,
              ),
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
                      function: () => GetJobsCubit.get(context).getJobs(
                        categoryId: categoryId,
                        search: search,
                      ),
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
