import 'package:elvateHub/core/themes/context.dart';
import 'package:elvateHub/core/widgets/custom_avatar_widget.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/community/domain/entities/post_entity.dart';
import 'package:flutter/widgets.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, required this.commentsEntity});
  final CommentsEntity commentsEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomAvatarWidget(
                avatar: commentsEntity.image,
                radius: 20,
              ),
              const HorizontalSizedBox(10),
              Text(
                commentsEntity.name,
                style: context.subBody,
              ),
            ],
          ),
          const VerticalSizedBox(10),
          Text(
            commentsEntity.comment,
            style: context.subBody,
          ),
        ],
      ),
    );
  }
}
