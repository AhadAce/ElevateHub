import 'dart:developer';

import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/job/data/models/job_model.dart';
import 'package:elvateHub/features/job/domain/entities/job_entity.dart';
import 'package:elvateHub/features/job/presentation/cubit/apply_job_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/global_bloc/file/file_cubit.dart';
import '../../../../core/global_bloc/file/file_state.dart';
import '../../../../core/widgets/title _text_field_widget.dart';

class ApplyJobScreen extends StatefulWidget {
  const ApplyJobScreen({
    super.key,
    required this.job,
  });
  final JobEntity job;
  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {
  late TextEditingController _cvController;
  late TextEditingController _additionalController;
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _cvController = TextEditingController();
    _additionalController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _cvController.dispose();
    _additionalController.dispose();
    _messageController.dispose();
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
              BlocConsumer<FileCubit, FileState>(
                listener: (context, state) {
                  if (state is FileChangeState) {
                    _cvController.text = FileCubit.fileName ?? '';
                  }
                  if (state is FileRemoveFileState) {
                    _cvController.text = '';
                  }
                },
                builder: (context, state) => TitleTextFieldWidget(
                  title: S.of(context).uploadYourResume,
                  hint: S.of(context).uploadYourResume,
                  controller: _cvController,
                  onTapFunction: () async {
                    await FileCubit.get(context).getFile();
                  },
                ),
              ),
              const VerticalSizedBox(16),
              BlocConsumer<FileCubit, FileState>(
                listener: (context, state) {
                  if (state is FileChange2State) {
                    _additionalController.text = FileCubit.fileName ?? '';
                  }
                  if (state is FileRemoveFileState) {
                    _additionalController.text = '';
                  }
                },
                builder: (context, state) => TitleTextFieldWidget(
                  title: S.of(context).uploadAdditionalDocs,
                  hint: S.of(context).uploadAdditionalDocs,
                  controller: _additionalController,
                  onTapFunction: () async {
                    await FileCubit.get(context).getFile2();
                  },
                ),
              ),
              const VerticalSizedBox(16),
              TitleTextFieldWidget(
                hint: S.of(context).wantWriteMassage,
                controller: _messageController,
                title: S.of(context).wantWriteMassage,
                maxLine: 5,
              ),
              const VerticalSizedBox(24),
              BlocConsumer<ApplyJobCubit, ApplyJobState>(
                listener: (context, state) {
                  if (state is ApplyJobSuccessState) {
                    customErrorToast(
                      context,
                      errorText: S.of(context).applySuccess,
                      isSuccess: true,
                    );
                    Navigator.pop(context);
                  }
                  if (state is ApplyJobErrorState) {
                    log('state.errorMessage ${state.errorMessage}');
                    customErrorToast(
                      context,
                      errorText: state.errorMessage,
                    );
                  }
                },
                builder: (context, state) => AppBtn(
                  isLoading: state is ApplyJobLoadingState,
                  title: S.of(context).applyNow,
                  function: () => ApplyJobCubit.get(context).applyJob(
                    application: Application(
                      additional: FileCubit.file2?.path ?? '',
                      cv: FileCubit.file?.path ?? '',
                      message: _messageController.text,
                      userId: context.user.id ?? '',
                      jobId: widget.job.id,
                      jobUserId: widget.job.userId,
                      status: ApplicationStatus.pending,
                    ),
                    jobjId: widget.job.id,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
