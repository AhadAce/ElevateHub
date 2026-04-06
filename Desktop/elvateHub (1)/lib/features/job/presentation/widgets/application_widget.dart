import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/image_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/features/job/data/models/job_model.dart';
import 'package:elvateHub/features/job/domain/entities/job_entity.dart';

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({
    super.key,
    required this.application,
  });
  final ApplicationEntity application;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: AppController.instance.getUserModel().type != UserType.user
          ? () => Navigator.pushNamed(
                context,
                AppRouter.applicationDetails,
                arguments: application,
              )
          : null,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightPrimaryColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 5.h,
        ),
        child: Row(
          children: [
            ImageWidget(
              image: application.jobEntity.imageUrl,
              width: 100,
              height: 100,
            ),
            const HorizontalSizedBox(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  application.jobEntity.title,
                  style: context.subBody,
                ),
                const VerticalSizedBox(5),
                Text(
                  application.status.toName(),
                  style: context.subBody,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
