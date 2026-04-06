import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_loading_widget.dart';
import 'package:elvateHub/core/widgets/error_state_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/features/job/presentation/widgets/application_widget.dart';
import 'package:flutter/material.dart';

import '../cubit/get_applications_cubit.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppController.instance.getUserModel().type == UserType.user
                    ? S.of(context).applications
                    : S.of(context).yourApplicationsStatus,
                style: context.mainTitle,
              ),
              const VerticalSizedBox(20),
              BlocBuilder<GetApplicationsCubit, GetApplicationsState>(
                builder: (context, state) {
                  if (state is GetApplicationsSuccessState) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ApplicationWidget(
                        application: state.applications[index],
                      ),
                      separatorBuilder: (context, index) =>
                          const VerticalSizedBox(10),
                      itemCount: state.applications.length,
                    );
                  } else if (state is GetApplicationsErrorState) {
                    return ErrorStateWidget(
                      error: state.errorMessage,
                      function: () =>
                          GetApplicationsCubit.get(context).getApplications(
                        needUserJob:
                            AppController.instance.getUserModel().type ==
                                UserType.user,
                      ),
                    );
                  } else {
                    return const CustomLoadingWidget();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
