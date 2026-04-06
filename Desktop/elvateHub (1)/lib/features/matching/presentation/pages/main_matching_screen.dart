import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_back_button.dart';
import 'package:elvateHub/core/widgets/custom_chat_button.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/features/matching/data/models/mentorship_model.dart';
import '../../../../core/widgets/custom_container.dart';

class MainMatchingScreen extends StatelessWidget {
  const MainMatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBackButton(),
                Text(
                  S.of(context).mentorshipHome,
                  style: context.mainTitle,
                ),
                const CustomChatButton(),
              ],
            ),
            const Spacer(),
            if (AppController.instance.getUserModel().type == UserType.user)
              CustomContainer(
                label: S.of(context).requestMentorship,
                function: () =>
                    Navigator.pushNamed(context, AppRouter.matching),
              ),
            CustomContainer(
              label: S.of(context).mentorshipHistory,
              function: () => Navigator.pushNamed(
                context,
                AppRouter.mentorshipHistory,
                arguments: {
                  'title': S.of(context).mentorshipHistory,
                },
              ),
            ),
            CustomContainer(
              label: S.of(context).pendingRequest,
              function: () => Navigator.pushNamed(
                context,
                AppRouter.mentorshipHistory,
                arguments: {
                  'title': S.of(context).pendingRequest,
                  'status': MentorshipStatus.pending,
                },
              ),
            ),
            CustomContainer(
              label: S.of(context).upcomingSession,
              function: () => Navigator.pushNamed(
                context,
                AppRouter.upcomingSession,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
