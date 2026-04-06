import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_colors.dart';

// todo :  Default Button in app
// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  String? text;
  // ignore: prefer_typing_uninitialized_variables
  var textColor;
  VoidCallback? onTap;
  // ignore: non_constant_identifier_names
  double? border_radius;
  // ignore: prefer_typing_uninitialized_variables
  var textSize;

  Widget? childWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(border_radius ?? 8.0),
      ),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(border_radius ?? 8.0)),
          ),
          child: childWidget ??
              Text(
                text!,
                style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontSize: textSize ?? 18,
                ),
              )),
    );
  }

  // ignore: use_key_in_widget_constructors
  DefaultButton(
      {this.text,
      this.onTap,
      this.border_radius,
      this.textSize,
      this.textColor,
      this.childWidget});
}
