import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elvateHub/core/themes/context.dart';

import '../themes/app_colors.dart';
import 'horizontal_sized_box.dart';

class AppBtn extends StatelessWidget {
  const AppBtn({
    super.key,
    required this.title,
    required this.function,
    this.titleStyle,
    this.borderColor,
    this.btnColor,
    this.width,
    this.textColor,
    this.prefix,
    this.height,
    this.autoWidth = true,
    this.isLoading = false,
    this.borderRadius,
    this.isNotAvailable = false,
  });

  final String title;
  final TextStyle? titleStyle;
  final Color? borderColor, btnColor, textColor;
  final VoidCallback function;
  final double? width, height, borderRadius;
  final bool isLoading;
  final Widget? prefix;
  final bool autoWidth, isNotAvailable;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading || isNotAvailable
          ? null
          : () {
              FocusScope.of(context).unfocus();
              function.call();
            },
      child: Container(
        width: autoWidth ? width : width ?? 255.w,
        height: height ?? 50.h,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: isNotAvailable
              ? AppColors.grey
              : btnColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 20.r),
          border: borderColor == null
              ? null
              : Border.all(
                  color: borderColor!,
                  width: 1,
                ),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: textColor ?? Colors.white,
                ),
              )
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (prefix != null) ...[
                      prefix!,
                      if (title.isNotEmpty)
                        const HorizontalSizedBox(
                          11,
                        )
                    ],
                    Text(
                      title,
                      style: (titleStyle ??
                              context.subBody!.copyWith(
                                color: context.scaffoldColor,
                              ))
                          .copyWith(
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
