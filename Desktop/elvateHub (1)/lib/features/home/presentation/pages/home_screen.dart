import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/core/widgets/welcome_widget.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import '../../../../core/widgets/custom_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const VerticalSizedBox(30),
            const WelcomeWidget(),
            const VerticalSizedBox(20),
            Text(
              S.of(context).whatDoLike,
              style: context.subBody,
            ),
            const VerticalSizedBox(20),
            CustomContainer(
              label: S.of(context).joinCommunity,
              function: () => Navigator.pushNamed(
                context,
                context.user.gender == Gender.male
                    ? AppRouter.community
                    : AppRouter.selectCommunity,
              ),
            ),
            CustomContainer(
              label: S.of(context).findANewJob,
              function: () => Navigator.pushNamed(
                context,
                AppRouter.job,
              ),
            ),
            // CustomContainer(
            //   label: S.of(context).enrollInCourses,
            //   function: () {},
            // ),
            // CustomContainer(
            //   label: S.of(context).joinAnEvent,
            //   function: () {},
            // ),
            // CustomContainer(
            //   label: S.of(context).exploreResourceLibrary,
            //   function: () {},
            // ),
            CustomContainer(
              label: S.of(context).findYourBestMatches,
              function: () => Navigator.pushNamed(
                context,
                AppRouter.mainMatching,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
