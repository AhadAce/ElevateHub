import 'package:elvateHub/core/themes/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.label,
    required this.function,
  });
  final String label;
  final void Function() function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 10.h),
      child: Center(
        child: GestureDetector(
          onTap: function,
          child: Container(
            width: 308.w,
            height: 70.h,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Text(
              label,
              style: context.subTitle!.copyWith(
                color: context.scaffoldColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
