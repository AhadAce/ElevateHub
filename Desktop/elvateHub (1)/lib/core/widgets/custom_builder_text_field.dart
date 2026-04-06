import 'package:elvateHub/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elvateHub/core/themes/context.dart';

class CustomBuilderTextFiled extends StatelessWidget {
  const CustomBuilderTextFiled({
    super.key,
    this.title,
    this.hintText,
    this.onSaved,
    this.onTap,
    this.onSubmit,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.inputBorder,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.prefix,
    this.focusNode,
    this.inputAction,
    this.autofocus = false,
    this.capitalization = TextCapitalization.none,
    this.labelColor,
    this.filled,
    this.fillColor,
    this.maxLines = 1,
    this.initialValue,
    this.maxLength,
    this.counterText,
    this.onChange,
    this.textDirection,
    this.borderColor,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.style,
    this.format,
    this.label,
    this.radius,
  });

  final String? title;
  final String? hintText;
  final void Function(String? value)? onSaved;
  final void Function()? onTap;
  final void Function(String? value)? onSubmit;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final InputBorder? inputBorder;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon, prefix;
  final FocusNode? focusNode;
  final TextInputAction? inputAction;
  final bool autofocus;
  final TextCapitalization capitalization;
  final Color? labelColor;
  final bool? filled;
  final Color? fillColor;
  final int? maxLines;
  final String? initialValue;
  final int? maxLength;
  final String? counterText;
  final void Function(String? value)? onChange;
  final TextDirection? textDirection;
  final TextStyle? style;
  final Color? borderColor;
  final TextAlign textAlign;
  final List<TextInputFormatter>? format;
  final TextAlignVertical? textAlignVertical;
  final String? label;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: controller,
      inputFormatters: format,
      key: key,
      focusNode: focusNode,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChange,
      onSubmitted: onSubmit,
      textInputAction: inputAction,
      obscureText: obscureText,
      obscuringCharacter: '*',
      keyboardType: keyboardType,
      autofocus: autofocus,
      textCapitalization: capitalization,
      maxLines: maxLines,
      maxLength: maxLength,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      style: context.subBody,
      decoration: InputDecoration(
        labelText: label,
        counterText: "",

        labelStyle: context.greyText,
        hintText: hintText,
        hintStyle: context.smallBody!.copyWith(
          color: context.scaffoldColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: borderColor ?? AppColors.primaryColor),
          borderRadius: BorderRadius.circular((radius ?? 8).r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: borderColor ?? AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular((radius ?? 8).r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: borderColor ?? AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular((radius ?? 8).r),
        ),
        prefix: prefix,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: borderColor ?? AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular((radius ?? 8).r),
        ),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: EdgeInsetsDirectional.only(start: 8.w, end: 8.w),
                child: prefixIcon ?? const SizedBox(),
              ),
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: suffixIcon,
              ),
        filled: filled,
        fillColor: fillColor,
        // border: InputBorder.none,
      ),
    );
  }
}
