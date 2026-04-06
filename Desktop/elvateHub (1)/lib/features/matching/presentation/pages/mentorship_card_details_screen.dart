import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/image_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/matching/data/models/mentorship_model.dart';
import 'package:elvateHub/features/matching/domain/entities/mentorship_entity.dart';
import 'package:elvateHub/features/matching/presentation/cubit/change_mentorship_status_cubit.dart';
import '../../../auth/domain/entities/user_entity.dart';

class MentorshipCardDetailsScreen extends StatelessWidget {
  const MentorshipCardDetailsScreen({
    super.key,
    required this.mentorshipEntity,
  });
  final MentorshipEntity mentorshipEntity;
  @override
  Widget build(BuildContext context) {
    bool isUser = AppController.instance.getUserModel().type == UserType.user;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                ImageWidget(
                  image: (isUser
                          ? mentorshipEntity.contributorEntity.image
                          : mentorshipEntity.userEntity.image) ??
                      '',
                  height: 100,
                  width: 100,
                ),
                const HorizontalSizedBox(10),
                Text(
                  (isUser
                      ? mentorshipEntity.contributorEntity.name
                      : mentorshipEntity.userEntity.name),
                  style: context.subBody,
                ),
              ],
            ),
            const VerticalSizedBox(24),
            BlocConsumer<ChangeMentorshipStatusCubit,
                ChangeMentorshipStatusState>(
              listener: (context, state) {
                if (state is ChangeMentorshipStatusSuccessState) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
                if (state is ChangeMentorshipStatusErrorState) {
                  customErrorToast(context, errorText: state.errorMessage);
                }
              },
              builder: (context, state) => Row(
                children: [
                  if (!isUser) ...[
                    if (mentorshipEntity.status ==
                        MentorshipStatus.pending) ...[
                      AppBtn(
                        title: S.of(context).reject,
                        function: () => ChangeMentorshipStatusCubit.get(context)
                            .changeMentorshipStatus(
                          mentorshipId: mentorshipEntity.id,
                          status: MentorshipStatus.reject,
                        ),
                      ),
                      const HorizontalSizedBox(20),
                      AppBtn(
                        title: S.of(context).accept,
                        function: () => ChangeMentorshipStatusCubit.get(context)
                            .changeMentorshipStatus(
                          mentorshipId: mentorshipEntity.id,
                          status: MentorshipStatus.approve,
                        ),
                      ),
                    ] else ...[
                      Text(
                        mentorshipEntity.status.toName(),
                        style: context.mainBody!.copyWith(
                          color: AppColors.successColor,
                        ),
                      )
                    ],
                  ] else ...[
                    if (mentorshipEntity.status != MentorshipStatus.cancel)
                      AppBtn(
                        title: S.of(context).cancel,
                        function: () => ChangeMentorshipStatusCubit.get(context)
                            .changeMentorshipStatus(
                          mentorshipId: mentorshipEntity.id,
                          status: MentorshipStatus.cancel,
                        ),
                      )
                    else
                      Text(
                        S.of(context).cancelled,
                        style: context.mainBody!.copyWith(
                          color: AppColors.dangerColor,
                        ),
                      ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
