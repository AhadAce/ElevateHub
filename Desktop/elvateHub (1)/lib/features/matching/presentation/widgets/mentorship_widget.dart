import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/image_widget.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/features/matching/data/models/mentorship_model.dart';
import 'package:elvateHub/features/matching/domain/entities/mentorship_entity.dart';
import 'package:flutter/cupertino.dart';

class MentorshipWidget extends StatelessWidget {
  const MentorshipWidget({
    super.key,
    required this.mentorshipEntity,
  });
  final MentorshipEntity mentorshipEntity;
  @override
  Widget build(BuildContext context) {
    bool isUser = AppController.instance.getUserModel().type == UserType.user;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.mentorshipCardDetails,
        arguments: mentorshipEntity,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.primaryColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Row(
          children: [
            ImageWidget(
              height: 100,
              width: 100,
              image: (isUser
                      ? mentorshipEntity.contributorEntity.image
                      : mentorshipEntity.userEntity.image) ??
                  '',
            ),
            const HorizontalSizedBox(10),
            Text(
              isUser
                  ? mentorshipEntity.contributorEntity.name
                  : mentorshipEntity.userEntity.name,
              style: context.subBody,
            ),
            const Spacer(),
            Text(
              mentorshipEntity.status.toName(),
              style: context.subBody,
            ),
          ],
        ),
      ),
    );
  }
}
