import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_back_button.dart';
import 'package:elvateHub/core/widgets/custom_loading_widget.dart';
import 'package:elvateHub/core/widgets/error_state_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/matching/presentation/cubit/get_contributor_cubit.dart';
import 'package:elvateHub/features/matching/presentation/widgets/contributor_card_widget.dart';

class MatchingScreen extends StatelessWidget {
  const MatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                const CustomBackButton(),
                const Spacer(),
                Text(
                  S.of(context).matching,
                  style: context.mainTitle,
                ),
                const Spacer(),
              ],
            ),
            const VerticalSizedBox(30),
            Text(
              S.of(context).matchedMentees,
              style: context.mainTitle,
            ),
            const VerticalSizedBox(30),
            BlocBuilder<GetContributorCubit, GetContributorState>(
              builder: (context, state) {
                if (state is GetContributorSuccessState) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ContributorCardWidget(
                      userEntity: state.success[index],
                    ),
                    separatorBuilder: (context, index) =>
                        const VerticalSizedBox(10),
                    itemCount: state.success.length,
                  );
                } else if (state is GetContributorErrorState) {
                  return ErrorStateWidget(
                    error: state.errorMessage,
                    function: () =>
                        GetContributorCubit.get(context).getContributor(),
                  );
                } else {
                  return const CustomLoadingWidget();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
