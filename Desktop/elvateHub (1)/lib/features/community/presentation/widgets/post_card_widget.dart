import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_avatar_widget.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/community/domain/entities/post_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({
    super.key,
    required this.postEntity,
    required this.isWomen,
  });
  final PostEntity postEntity;
  final bool isWomen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.postScreen,
        arguments: {
          'post': postEntity,
          'isWomen': isWomen,
        },
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 5.h,
        ),
        decoration: BoxDecoration(
          color: context.primaryColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          children: [
            CustomAvatarWidget(
              avatar: postEntity.userEntity.image,
            ),
            const HorizontalSizedBox(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          postEntity.title,
                          style: context.subBody,
                        ),
                      ),
                      const HorizontalSizedBox(5),
                      Text(
                        '@${postEntity.userEntity.name}',
                        style: context.smallBody,
                      )
                    ],
                  ),
                  const VerticalSizedBox(5),
                  Text(
                    postEntity.desc,
                    style: context.subBody,
                  ),
                  if (postEntity.resource.isNotEmpty) ...[
                    const VerticalSizedBox(5),
                    AppBtn(
                      title: S.of(context).resource,
                      function: () => launch(
                        postEntity.resource,
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
