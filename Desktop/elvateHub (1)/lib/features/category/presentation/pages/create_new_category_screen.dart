import 'package:elvateHub/core/global_bloc/image/image_cubit.dart';
import 'package:elvateHub/core/global_bloc/image/image_state.dart';
import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/title%20_text_field_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/category/data/models/category_model.dart';
import 'package:elvateHub/features/category/presentation/manager/create_new_category_cubit.dart';

import '../../../../core/helpers/custom_validation.dart';
import '../../../../core/widgets/custom_circle_avatar.dart';

class CreateNewCategoryScreen extends StatefulWidget {
  const CreateNewCategoryScreen({super.key});

  @override
  State<CreateNewCategoryScreen> createState() =>
      _CreateNewCategoryScreenState();
}

class _CreateNewCategoryScreenState extends State<CreateNewCategoryScreen> {
  late TextEditingController _arabicName;
  late TextEditingController _englishName;

  @override
  void initState() {
    super.initState();
    _arabicName = TextEditingController();
    _englishName = TextEditingController();
    ImageCubit.imageProfile = null;
  }

  @override
  void dispose() {
    super.dispose();
    _englishName.dispose();
    _arabicName.dispose();
    ImageCubit.imageProfile = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<ImageCubit, ImageState>(
                builder: (context, state) => Stack(
                  children: [
                    CustomCircleAvatar(
                      imageFile: ImageCubit.imageProfile,
                      radius: 64,
                      backgroundColor: context.primaryColor,
                    ),
                    InkWell(
                      onTap: () => ImageCubit.get(context).getImage(),
                      child: CustomCircleAvatar(
                        radius: 22,
                        backgroundColor: AppColors.primaryColor,
                        child: CustomCircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(
                            Icons.camera,
                            color: context.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSizedBox(16),
              TitleTextFieldWidget(
                hint: S.of(context).arabicName,
                controller: _arabicName,
                title: S.of(context).arabicName,
              ),
              const VerticalSizedBox(16),
              TitleTextFieldWidget(
                hint: S.of(context).englishName,
                title: S.of(context).englishName,
                controller: _englishName,
              ),
              const VerticalSizedBox(16),
              BlocConsumer<CreateNewCategoryCubit, CreateNewCategoryState>(
                listener: (context, state) {
                  if (state is CreateNewCategorySuccessState) {
                    customErrorToast(context,
                        errorText: S.of(context).createNewCategorySuccess,
                        isSuccess: true);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouter.main,
                      (_) => false,
                      arguments: 1,
                    );
                  }
                  if (state is CreateNewCategoryErrorState) {
                    customErrorToast(context, errorText: state.errorMessage);
                  }
                },
                builder: (context, state) => AppBtn(
                  isLoading: state is CreateNewCategoryLoadingState,
                  title: S.of(context).add,
                  function: () {
                    bool validation1 = CustomValidator.validateTextFields(
                      context: context,
                      controllers: [
                        _arabicName,
                        _englishName,
                      ],
                      errorMessages: [
                        S.of(context).arabicNameError,
                        S.of(context).englishNameError,
                      ],
                    );
                    if (validation1) {
                      CreateNewCategoryCubit.get(context).createNewCategory(
                        categoryModel: getFinalCategoryModel(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CategoryModel getFinalCategoryModel() => CategoryModel(
        id: null,
        flag: ImageCubit.imageProfile?.path,
        name: _englishName.text,
        needUploadFile: false,
      );
}
