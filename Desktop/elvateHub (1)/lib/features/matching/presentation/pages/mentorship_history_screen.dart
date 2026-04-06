import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_loading_widget.dart';
import 'package:elvateHub/core/widgets/error_state_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/matching/data/models/mentorship_model.dart';
import 'package:elvateHub/features/matching/presentation/cubit/get_mentorship_cubit.dart';
import 'package:elvateHub/features/matching/presentation/widgets/mentorship_widget.dart';

import '../../../../core/widgets/custom_back_button.dart';

class MentorshipHistoryScreen extends StatelessWidget {
  const MentorshipHistoryScreen({
    super.key,
    required this.status,
    required this.title,
  });
  final MentorshipStatus? status;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBackButton(),
                const Spacer(),
                Text(
                  title,
                  style: context.mainTitle,
                ),
                const Spacer(),
              ],
            ),
            const VerticalSizedBox(20),
            Expanded(
              child: BlocBuilder<GetMentorshipCubit, GetMentorshipState>(
                builder: (context, state) {
                  if (state is GetMentorshipSuccessState) {
                    return ListView.separated(
                      itemBuilder: (context, index) => MentorshipWidget(
                        mentorshipEntity: state.success[index],
                      ),
                      separatorBuilder: (context, index) =>
                          const VerticalSizedBox(10),
                      itemCount: state.success.length,
                    );
                  } else if (state is GetMentorshipErrorState) {
                    return ErrorStateWidget(
                      error: state.errorMessage,
                      function: () =>
                          GetMentorshipCubit.get(context).getMentorship(
                        status: status,
                      ),
                    );
                  } else {
                    return const CustomLoadingWidget();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
