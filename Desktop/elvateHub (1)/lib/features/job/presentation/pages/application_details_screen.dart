import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/image_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/job/domain/entities/job_entity.dart';
import 'package:elvateHub/features/job/presentation/cubit/approve_user_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicationDetailsScreen extends StatelessWidget {
  const ApplicationDetailsScreen({
    super.key,
    required this.applicationEntity,
  });
  final ApplicationEntity applicationEntity;
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
              Text(
                S.of(context).applications,
                style: context.mainTitle,
              ),
              const VerticalSizedBox(20),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightPrimaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 5.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ImageWidget(
                          image: applicationEntity.userEntity.image ?? '',
                          height: 100,
                          width: 100,
                        ),
                        const HorizontalSizedBox(20),
                        Column(
                          children: [
                            Text(
                              applicationEntity.userEntity.name,
                              style: context.subTitle,
                            ),
                            const VerticalSizedBox(5),
                            Text(
                              applicationEntity.jobEntity.title,
                              style: context.subBody,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const VerticalSizedBox(20),
                    Row(
                      children: [
                        Text(
                          applicationEntity.message,
                          style: context.subBody,
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            AppBtn(
                              width: 100,
                              title: S.of(context).cv,
                              prefix: Icon(
                                Icons.upload,
                                color: context.scaffoldColor,
                              ),
                              function: () => launch(applicationEntity.cv),
                            ),
                            const VerticalSizedBox(5),
                            AppBtn(
                              prefix: Icon(
                                Icons.upload,
                                color: context.scaffoldColor,
                              ),
                              width: 100,
                              title: S.of(context).docs,
                              function: () =>
                                  launch(applicationEntity.additional),
                            ),
                          ],
                        )
                      ],
                    ),
                    const VerticalSizedBox(20),
                    BlocListener<ApproveUserCubit, ApproveUserState>(
                      listener: (context, state) {
                        if (state is ApproveUserSuccessState) {
                          customErrorToast(
                            context,
                            errorText: S.of(context).updateStatusSuccess,
                            isSuccess: true,
                          );
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                        if (state is ApproveUserErrorState) {
                          customErrorToast(
                            context,
                            errorText: state.errorMessage,
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppBtn(
                            title: S.of(context).accept,
                            function: () =>
                                ApproveUserCubit.get(context).approveUser(
                              approve: true,
                              applicationId: applicationEntity.id,
                            ),
                          ),
                          const HorizontalSizedBox(20),
                          AppBtn(
                            title: S.of(context).reject,
                            function: () =>
                                ApproveUserCubit.get(context).approveUser(
                              approve: false,
                              applicationId: applicationEntity.id,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalSizedBox(20),
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
