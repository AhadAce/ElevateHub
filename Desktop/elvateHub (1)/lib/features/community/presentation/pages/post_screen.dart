import 'package:elvateHub/core/assets/assets.gen.dart';
import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_avatar_widget.dart';
import 'package:elvateHub/core/widgets/custom_divider.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/title%20_text_field_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/auth/data/models/user_model.dart';
import 'package:elvateHub/features/community/domain/entities/post_entity.dart';
import 'package:elvateHub/features/community/presentation/cubit/comment_post_cubit.dart';
import 'package:elvateHub/features/community/presentation/cubit/like_post_cubit.dart';
import 'package:elvateHub/features/community/presentation/widgets/comment_widget.dart';
import 'package:share_plus/share_plus.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({
    super.key,
    required this.post,
    required this.isWomen,
  });
  final PostEntity post;
  final bool isWomen;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late TextEditingController _comment;
  late PostEntity data;
  @override
  void initState() {
    super.initState();
    data = widget.post;
    _comment = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _comment.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 5.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightPrimaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomAvatarWidget(
                          avatar: data.userEntity.image,
                        ),
                        const HorizontalSizedBox(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title,
                              style: context.subTitle,
                            ),
                            Text(
                              '@${data.userEntity.name}',
                              style: context.greyText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const VerticalSizedBox(15),
                    Text(
                      data.desc,
                      style: context.subBody,
                    ),
                    const VerticalSizedBox(15),
                    Row(
                      children: [
                        const Spacer(),
                        BlocConsumer<LikePostCubit, LikePostState>(
                          listener: (context, state) {
                            if (state is LikePostLoadingState) {
                              data = data.copyWith(
                                isLike: state.isLike,
                              );
                            }
                            if (state is LikePostErrorState) {
                              data = data.copyWith(
                                isLike: !state.isLike,
                              );
                            }
                          },
                          builder: (context, state) => InkWell(
                            onTap: () => LikePostCubit.get(context).likePost(
                              postId: data.id,
                              like: !data.isLike,
                              isWomen: widget.isWomen,
                            ),
                            child: Assets.images.like.svg(
                              color: data.isLike ? Colors.red : null,
                            ),
                          ),
                        ),
                        const HorizontalSizedBox(10),
                        InkWell(
                          onTap: () =>
                              Share.share('${data.title} \n ${data.desc}'),
                          child: Assets.images.share.svg(),
                        ),
                        const HorizontalSizedBox(10),
                        InkWell(
                          onTap: () => reportReasonDialog(
                            context,
                            postId: data.id,
                          ),
                          child: Assets.images.report.svg(),
                        ),
                      ],
                    ),
                    const CustomDivider(),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => CommentWidget(
                        commentsEntity: data.comments[index],
                      ),
                      separatorBuilder: (context, index) =>
                          const VerticalSizedBox(10),
                      itemCount: data.comments.length,
                    ),
                    const VerticalSizedBox(20),
                    TitleTextFieldWidget(
                      fillColor: context.primaryColor,
                      hint: S.of(context).enterComment,
                      controller: _comment,
                      suffix: BlocListener<CommentPostCubit, CommentPostState>(
                        listener: (context, state) {
                          if (state is CommentPostSuccessState) {
                            List<CommentsEntity> comments = data.comments;
                            comments.add(
                              CommentsEntity(
                                comment: state.comment,
                                userId: context.user.id ?? '',
                                image: context.user.image ?? '',
                                name: context.user.name,
                                userEntity: UserModel.emptyOne().toEntity(),
                              ),
                            );
                            data = data.copyWith(
                              comments: comments,
                            );
                            _comment.text = '';
                            setState(() {});
                          }
                        },
                        child: InkWell(
                          onTap: () {
                            CommentPostCubit.get(context).commentPost(
                              postId: data.id,
                              comment: _comment.text,
                              userId: context.user.id ?? '',
                              name: context.user.name,
                              image: context.user.image ?? '',
                              isWomen: widget.isWomen,
                            );
                          },
                          child: const Icon(
                            Icons.send,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
