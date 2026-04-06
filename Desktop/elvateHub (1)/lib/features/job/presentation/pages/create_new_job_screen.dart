import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/title%20_text_field_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/job/data/models/job_model.dart';
import 'package:elvateHub/features/job/domain/entities/job_entity.dart';
import 'package:elvateHub/features/job/presentation/cubit/create_new_job_cubit.dart';
import '../../../../core/global_bloc/drop_list/drop_list_cubit.dart';
import '../../../../core/helpers/string_constant.dart';
import '../../../../core/widgets/drop_down_widget.dart';
import '../../../category/presentation/manager/get_category_cubit.dart';

class CreateNewJobScreen extends StatefulWidget {
  const CreateNewJobScreen({
    super.key,
    this.jobEntity,
  });
  final JobEntity? jobEntity;
  @override
  State<CreateNewJobScreen> createState() => _CreateNewJobScreenState();
}

class _CreateNewJobScreenState extends State<CreateNewJobScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late TextEditingController _companyNameController;
  late TextEditingController _imageUrlController;
  late TextEditingController _jobRequirementController;
  bool forWomen = false;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _companyNameController = TextEditingController();
    _imageUrlController = TextEditingController();
    _jobRequirementController = TextEditingController();
    if (widget.jobEntity != null) {
      _titleController.text = widget.jobEntity!.title;
      _descController.text = widget.jobEntity!.desc;
      _companyNameController.text = widget.jobEntity!.companyName;
      _imageUrlController.text = widget.jobEntity!.imageUrl;
      _jobRequirementController.text = widget.jobEntity!.jobRequirment;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descController.dispose();
    _companyNameController.dispose();
    _imageUrlController.dispose();
    _jobRequirementController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              TitleTextFieldWidget(
                hint: S.of(context).jobTitle,
                controller: _titleController,
                title: S.of(context).jobTitle,
              ),
              const VerticalSizedBox(16),
              TitleTextFieldWidget(
                hint: S.of(context).jobDesc,
                controller: _descController,
                title: S.of(context).jobDesc,
              ),
              const VerticalSizedBox(16),
              TitleTextFieldWidget(
                hint: S.of(context).jobRequirement,
                controller: _jobRequirementController,
                title: S.of(context).jobRequirement,
                maxLine: 4,
              ),
              const VerticalSizedBox(16),
              TitleTextFieldWidget(
                hint: S.of(context).companyName,
                controller: _companyNameController,
                title: S.of(context).companyName,
              ),
              const VerticalSizedBox(16),
              TitleTextFieldWidget(
                hint: S.of(context).imageUrl,
                controller: _imageUrlController,
                title: S.of(context).imageUrl,
              ),
              const VerticalSizedBox(16),
              BlocBuilder<GetCategoryCubit, GetCategoriesState>(
                builder: (context, state) => DropDownWidget(
                  keyStr: categoryKey,
                  list: state is GetCategoriesSuccessState
                      ? state.categories
                      : [],
                  value: DropListCubit.dropListValue[categoryKey]?.name ?? '',
                  title: S.of(context).interests,
                  needTitle: true,
                ),
              ),
              CheckboxListTile(
                value: forWomen,
                onChanged: (val) {
                  forWomen = val ?? false;
                  setState(() {});
                },
                title: Text(
                  S.of(context).forWomen,
                  style: context.smallBody,
                ),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const VerticalSizedBox(24),
              BlocConsumer<CreateNewJobCubit, CreateNewJobState>(
                listener: (context, state) {
                  if (state is CreateNewJobSuccessState) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRouter.job);
                    customErrorToast(
                      context,
                      errorText: state.isUpdate
                          ? S.of(context).jobUpdateSuccess
                          : S.of(context).jobCreateSuccess,
                      isSuccess: true,
                    );
                  }
                  if (state is CreateNewJobErrorState) {
                    customErrorToast(context, errorText: state.errorMessage);
                  }
                },
                builder: (context, state) => AppBtn(
                  isLoading: state is CreateNewJobLoadingState,
                  title: widget.jobEntity != null
                      ? S.of(context).updateJob
                      : S.of(context).createNewJob,
                  function: () => CreateNewJobCubit.get(context).createNewJob(
                    jobModel: _finalJobModel(),
                    isUpdate: widget.jobEntity != null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  JobModel _finalJobModel() => JobModel(
        imageUrl: _imageUrlController.text,
        categoryId: DropListCubit.dropListValue[categoryKey]?.id ?? '',
        userId: context.user.id ?? '',
        createdAt: Timestamp.now(),
        desc: _descController.text,
        title: _titleController.text,
        companyName: _companyNameController.text,
        jobRequirment: _jobRequirementController.text,
        id: widget.jobEntity?.id,
        forWomen: forWomen,
      );
}
