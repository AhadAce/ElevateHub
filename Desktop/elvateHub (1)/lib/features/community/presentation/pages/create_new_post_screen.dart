import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvateHub/core/global_bloc/drop_list/drop_list_state.dart';
import 'package:elvateHub/core/helpers/custom_validation.dart';
import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/helpers/string_constant.dart';
import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/drop_down_widget.dart';
import 'package:elvateHub/core/widgets/title%20_text_field_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/category/presentation/manager/get_category_cubit.dart';
import 'package:elvateHub/features/community/data/models/post_model.dart';
import 'package:elvateHub/features/community/presentation/cubit/create_new_post_cubit.dart';
import '../../../../core/global_bloc/drop_list/drop_list_cubit.dart';
import '../../../../core/global_bloc/file/file_cubit.dart';
import '../../../../core/global_bloc/file/file_state.dart';

class CreateNewPostScreen extends StatefulWidget {
  const CreateNewPostScreen({
    super.key,
    required this.isWomen,
  });
  final bool isWomen;
  @override
  State<CreateNewPostScreen> createState() => _CreateNewPostScreenState();
}

class _CreateNewPostScreenState extends State<CreateNewPostScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late TextEditingController _resourceController;
  @override
  void initState() {
    super.initState();
    FileCubit.file = null;
    FileCubit.get(context).removeFile();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _resourceController = TextEditingController();
    DropListCubit.dropListValue.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
    _resourceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: BlocBuilder<DropListCubit, DropListState>(
          builder: (context, state) => SingleChildScrollView(
            child: Column(
              children: [
                TitleTextFieldWidget(
                  hint: S.of(context).postTitle,
                  controller: _titleController,
                  title: S.of(context).postTitle,
                ),
                const VerticalSizedBox(16),
                TitleTextFieldWidget(
                  hint: S.of(context).postDesc,
                  controller: _contentController,
                  title: S.of(context).postDesc,
                ),
                const VerticalSizedBox(16),
                BlocBuilder<GetCategoryCubit, GetCategoriesState>(
                  builder: (context, state) => DropDownWidget(
                    keyStr: categoryKey,
                    list: state is GetCategoriesSuccessState
                        ? state.categories
                        : [],
                    value: DropListCubit.dropListValue[categoryKey]?.name ?? '',
                    title: S.of(context).postCategory,
                  ),
                ),
                if (DropListCubit.dropListValue[categoryKey]?.needUploadFile ??
                    false)
                  BlocConsumer<FileCubit, FileState>(
                    listener: (context, state) {
                      if (state is FileChangeState) {
                        _resourceController.text = FileCubit.fileName ?? '';
                      }
                      if (state is FileRemoveFileState) {
                        _resourceController.text = '';
                      }
                    },
                    builder: (context, state) => TitleTextFieldWidget(
                      title: S.of(context).addResource,
                      hint: S.of(context).addResource,
                      controller: _resourceController,
                      onTapFunction: () async {
                        await FileCubit.get(context).getFile();
                      },
                    ),
                  ),
                const VerticalSizedBox(24),
                BlocConsumer<CreateNewPostCubit, CreateNewPostState>(
                  listener: (context, state) {
                    if (state is CreateNewPostSuccessState) {
                      customErrorToast(
                        context,
                        errorText: S.of(context).createPostSuccessfully,
                        isSuccess: true,
                      );
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        AppRouter.community,
                        arguments: widget.isWomen,
                      );
                    }
                  },
                  builder: (context, state) => AppBtn(
                    isLoading: state is CreateNewPostLoadingState,
                    title: S.of(context).post,
                    function: () {
                      bool validation = CustomValidator.validateTextFields(
                        context: context,
                        controllers: [_titleController, _contentController],
                        errorMessages: [
                          S.of(context).postTitleError,
                          S.of(context).postDescError,
                        ],
                      );
                      if (validation) {
                        CreateNewPostCubit.get(context).createNewPost(
                          postModel: _finalPostModel(),
                          isWomen: widget.isWomen,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PostModel _finalPostModel() => PostModel(
        categoryId: DropListCubit.dropListValue[categoryKey]?.id ?? '',
        comments: [],
        userId: context.user.id ?? '',
        createdAt: Timestamp.now(),
        desc: _contentController.text,
        likes: [],
        title: _titleController.text,
        resource: FileCubit.file?.path,
      );
}
