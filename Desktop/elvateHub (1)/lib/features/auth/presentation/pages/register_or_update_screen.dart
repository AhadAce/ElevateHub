import 'package:elvateHub/core/global_bloc/drop_list/drop_list_cubit.dart';
import 'package:elvateHub/core/global_bloc/drop_list/drop_list_state.dart';
import 'package:elvateHub/core/global_bloc/image/image_cubit.dart';
import 'package:elvateHub/core/global_bloc/image/image_state.dart';
import 'package:elvateHub/core/global_model/drop_down_model.dart';
import 'package:elvateHub/core/helpers/constant.dart';
import 'package:elvateHub/core/helpers/custom_validation.dart';
import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/helpers/string_constant.dart';
import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_circle_avatar.dart';
import 'package:elvateHub/core/widgets/drop_down_widget.dart';
import 'package:elvateHub/core/widgets/mobile_number_filed.dart';
import 'package:elvateHub/core/widgets/title%20_text_field_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/auth/data/models/user_model.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:elvateHub/features/category/presentation/manager/get_category_cubit.dart';

import '../../../../core/global_bloc/file/file_cubit.dart';
import '../../../../core/global_bloc/file/file_state.dart';

class RegisterOrUpdateScreen extends StatefulWidget {
  const RegisterOrUpdateScreen({
    super.key,
    this.fromProfile = false,
  });
  final bool fromProfile;

  @override
  State<RegisterOrUpdateScreen> createState() => _RegisterOrUpdateScreenState();
}

class _RegisterOrUpdateScreenState extends State<RegisterOrUpdateScreen> {
  late TextEditingController _fullNameNameController;
  late TextEditingController _birthDateController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _bioController;
  late TextEditingController _passwordController;
  late TextEditingController _fileController;

  @override
  void initState() {
    super.initState();
    ImageCubit.imageProfile = null;
    _fullNameNameController = TextEditingController();
    _birthDateController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _bioController = TextEditingController();
    _passwordController = TextEditingController();
    _fileController = TextEditingController();
    ImageCubit.imageProfile = null;
    DropListCubit.dropListValue.clear();
    if (widget.fromProfile) {
      _fullNameNameController.text = context.user.name;
      _phoneController.text = context.user.mobileNumber;
      _emailController.text = context.user.email;
      _birthDateController.text = context.user.birthDate.toString();
      DropDownModel gender = DropDownModel(
        id: context.user.gender.name,
        name: context.user.gender.nameText,
      );
      DropListCubit.dropListValue[genderKey] = gender;
    }
  }

  @override
  void dispose() {
    super.dispose();
    ImageCubit.imageProfile = null;
    DropListCubit.dropListValue.clear();
    _fullNameNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _birthDateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSizedBox(30),
              if (!widget.fromProfile) ...[
                Text(
                  S.of(context).welcomeToelvateHub,
                  style: context.subTitle,
                ),
                Text(
                  S.of(context).registerDesc,
                  style: context.subBody,
                ),
              ],
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<ImageCubit, ImageState>(
                    builder: (context, imageState) => Center(
                      child: Stack(
                        children: [
                          ImageCubit.imageProfile != null
                              ? CustomCircleAvatar(
                                  imageFile: ImageCubit.imageProfile!,
                                  radius: 64,
                                  backgroundColor: context.primaryColor,
                                )
                              : CustomCircleAvatar(
                                  imageUrl: context.user.image,
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
                  ),
                  const VerticalSizedBox(32),
                  TitleTextFieldWidget(
                    title: S.of(context).fullName,
                    hint: S.of(context).fullName,
                    controller: _fullNameNameController,
                  ),
                  const VerticalSizedBox(16),
                  TitleTextFieldWidget(
                    title: S.of(context).email,
                    hint: S.of(context).email,
                    controller: _emailController,
                    keyboard: TextInputType.emailAddress,
                  ),
                  if (!widget.fromProfile) ...[
                    const VerticalSizedBox(16),
                    TitleTextFieldWidget(
                      title: S.of(context).password,
                      hint: S.of(context).password,
                      controller: _passwordController,
                      isPassword: true,
                    ),
                  ],
                  const VerticalSizedBox(16),
                  TitleTextFieldWidget(
                    title: S.of(context).birthday,
                    hint: S.of(context).birthday,
                    controller: _birthDateController,
                    onTapFunction: () async {
                      DateTime? date = await selectDate(
                        context,
                        from: DateTime(1900),
                        to: DateTime(DateTime.now().year - 16),
                      );
                      if (date != null) {
                        _birthDateController.text = dateToString(date);
                      }
                    },
                  ),
                  const VerticalSizedBox(16),
                  MobileNumberFiled(
                    controller: _phoneController,
                    needTitle: true,
                    titleTextStyle: context.greyText,
                  ),
                  DropDownWidget(
                    keyStr: genderKey,
                    list: genderList,
                    value: DropListCubit.dropListValue[genderKey]?.name ?? '',
                    title: S.of(context).gender,
                    needTitle: true,
                  ),
                  DropDownWidget(
                    keyStr: userTypeKey,
                    list: userTypes,
                    value: DropListCubit.dropListValue[userTypeKey]?.name ?? '',
                    title: S.of(context).userType,
                    needTitle: true,
                  ),
                  BlocBuilder<DropListCubit, DropListState>(
                    builder: (context, state) => getUserType(
                                DropListCubit.dropListValue[userTypeKey]?.id ??
                                    UserType.user.id) ==
                            UserType.contributor
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              BlocConsumer<FileCubit, FileState>(
                                listener: (context, state) {
                                  if (state is FileChangeState) {
                                    _fileController.text =
                                        FileCubit.fileName ?? '';
                                  }
                                  if (state is FileRemoveFileState) {
                                    _fileController.text = '';
                                  }
                                },
                                builder: (context, state) =>
                                    TitleTextFieldWidget(
                                  title: S.of(context).sendAttachment,
                                  hint: S.of(context).sendAttachment,
                                  controller: _fileController,
                                  onTapFunction: () async {
                                    await FileCubit.get(context).getFile();
                                  },
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ),
                  BlocBuilder<GetCategoryCubit, GetCategoriesState>(
                    builder: (context, state) => DropDownWidget(
                      keyStr: categoryKey,
                      list: state is GetCategoriesSuccessState
                          ? state.categories
                          : [],
                      value:
                          DropListCubit.dropListValue[categoryKey]?.name ?? '',
                      title: S.of(context).interests,
                      needTitle: true,
                    ),
                  ),
                  const VerticalSizedBox(32),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is RegisterSuccessState) {
                        if (state.userModel.isActive) {
                          AppController.instance.setLoggedIn(true);
                          AppController.instance.saveUser(state.userModel);
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppRouter.main, (_) => false);
                        } else {
                          customErrorToast(
                            context,
                            errorText: S.of(context).waitToActiveAccount,
                            isSuccess: true,
                          );
                          Navigator.pop(context);
                        }
                      }
                      if (state is RegisterErrorState) {
                        customErrorToast(
                          context,
                          errorText: state.errorMessage,
                        );
                      }
                    },
                    builder: (context, state) => AppBtn(
                      title: widget.fromProfile
                          ? S.of(context).save
                          : S.of(context).register,
                      function: () {
                        bool validation1 = CustomValidator.validateTextFields(
                          context: context,
                          controllers: [
                            _fullNameNameController,
                            _emailController,
                            _phoneController,
                          ],
                          errorMessages: [
                            S.of(context).fullNameError,
                            S.of(context).emailError,
                            S.of(context).mobileNumberError,
                          ],
                        );
                        bool validation2 = CustomValidator.specialValidation(
                          context: context,
                          map: {
                            S.of(context).sendAttachmentError: !((getUserType(
                                        DropListCubit.dropListValue[userTypeKey]
                                                ?.id ??
                                            UserType.user.id) ==
                                    UserType.contributor) &&
                                FileCubit.file == null),
                          },
                        );
                        if (validation1 && validation2) {
                          context.read<AuthCubit>().register(
                                userModel: getFinalUserModel(),
                                password: widget.fromProfile
                                    ? null
                                    : _passwordController.text,
                              );
                        }
                      },
                      isLoading: state is RegisterLoadingState,
                    ),
                  ),
                  const VerticalSizedBox(32),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  UserModel getFinalUserModel() => UserModel(
        name: _fullNameNameController.text,
        email: _emailController.text,
        image: ImageCubit.imageProfile?.path,
        attachment: FileCubit.file?.path,
        type: getUserType(
            DropListCubit.dropListValue[userTypeKey]?.id ?? UserType.user.id),
        mobileNumber: _phoneController.text,
        gender: stringToGender[
                DropListCubit.dropListValue[genderKey]?.id ?? 'male'] ??
            Gender.male,
        categoryId: DropListCubit.dropListValue[categoryKey]?.id ?? '',
        birthDate:
            DateTime.tryParse(_birthDateController.text) ?? DateTime.now(),
        isActive: widget.fromProfile
            ? true
            : (getUserType(DropListCubit.dropListValue[userTypeKey]?.id ??
                        UserType.user.id) ==
                    UserType.contributor
                ? false
                : true),
        rate: 0,
        rateList: [],
      );
}
