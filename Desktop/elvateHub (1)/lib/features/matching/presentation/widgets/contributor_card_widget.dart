import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_rating_widget.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/image_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/features/matching/data/models/mentorship_model.dart';

class ContributorCardWidget extends StatelessWidget {
  const ContributorCardWidget({
    super.key,
    required this.userEntity,
  });
  final UserEntity userEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.mentorshipDetails,
        arguments: MentorshipModel(
          contributorId: userEntity.id ?? '',
          status: MentorshipStatus.pending,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 5.h,
        ),
        decoration: BoxDecoration(
          color: context.primaryColor,
        ),
        child: Row(
          children: [
            ImageWidget(
              image: userEntity.image ?? '',
              height: 100,
              width: 100,
            ),
            const HorizontalSizedBox(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userEntity.name,
                  style: context.subBody,
                ),
                const VerticalSizedBox(5),
                CustomRateWidget(
                  rate: userEntity.rate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
