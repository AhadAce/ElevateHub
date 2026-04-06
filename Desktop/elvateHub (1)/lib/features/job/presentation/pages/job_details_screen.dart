import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/job/domain/entities/job_entity.dart';
import 'package:flutter/material.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({
    super.key,
    required this.jobEntity,
  });
  final JobEntity jobEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 10.h,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.lightPrimaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  jobEntity.title,
                  style: context.subBody,
                ),
              ),
              const VerticalSizedBox(20),
              Text(
                S.of(context).jobDesc,
                style: context.subBody,
              ),
              const VerticalSizedBox(10),
              Text(
                jobEntity.desc,
                style: context.subBody,
              ),
              const VerticalSizedBox(10),
              Text(
                S.of(context).jobRequirement,
                style: context.subBody,
              ),
              const VerticalSizedBox(10),
              Text(
                jobEntity.jobRequirment,
                style: context.subBody,
              ),
              const VerticalSizedBox(10),
              Text(
                S.of(context).companyName,
                style: context.subBody,
              ),
              const VerticalSizedBox(10),
              Text(
                jobEntity.companyName,
                style: context.subBody,
              ),
              const Spacer(),
              AppBtn(
                title: S.of(context).applyNow,
                function: () => Navigator.pushNamed(
                  context,
                  AppRouter.applyJob,
                  arguments: jobEntity,
                ),
              ),
              const VerticalSizedBox(20),
            ],
          ),
        ),
      ),
    );
  }
}
