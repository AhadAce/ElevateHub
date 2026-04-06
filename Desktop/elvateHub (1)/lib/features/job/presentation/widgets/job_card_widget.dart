import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/image_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/features/job/domain/entities/job_entity.dart';

class JobCardWidget extends StatelessWidget {
  const JobCardWidget({super.key, required this.jobEntity});
  final JobEntity jobEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.user.type != UserType.user
          ? Navigator.pushNamed(
              context,
              AppRouter.createNewJob,
              arguments: jobEntity,
            )
          : Navigator.pushNamed(
              context,
              AppRouter.jobDetails,
              arguments: jobEntity,
            ),
      child: Column(
        children: [
          ImageWidget(
            image: jobEntity.imageUrl,
            height: 120,
            width: 120,
          ),
          const VerticalSizedBox(10),
          Text(
            jobEntity.title,
            style: context.subBody,
          ),
        ],
      ),
    );
  }
}
