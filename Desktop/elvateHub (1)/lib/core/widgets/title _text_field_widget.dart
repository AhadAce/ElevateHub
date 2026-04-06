import 'package:flutter/services.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'custom_builder_text_field.dart';
import 'vertical_sized_box.dart';

class TitleTextFieldWidget extends StatelessWidget {
  const TitleTextFieldWidget({
    super.key,
    this.title = '',
    required this.hint,
    required this.controller,
    this.isOnlyNumber = false,
    this.isPassword = false,
    this.maxLine = 1,
    this.validationStr,
    this.readOnly = false,
    this.suffix,
    this.prefix,
    this.isValidate = true,
    this.needTitle = true,
    this.fillColor,
    this.function,
    this.onSubmit,
    this.onChange,
    this.keyboard,
    this.titleStyle,
    this.onTapFunction,
    this.radius,
  });
  final String title, hint;
  final TextEditingController? controller;
  final bool isOnlyNumber, isPassword;
  final int? maxLine;
  final String? validationStr;
  final bool readOnly, isValidate, needTitle;
  final Widget? suffix, prefix;
  final Color? fillColor;
  final double? radius;
  final VoidCallback? function;
  final void Function(String? value)? onSubmit;
  final TextStyle? titleStyle;
  final void Function(String?)? onChange;
  final TextInputType? keyboard;
  final void Function()? onTapFunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty) ...[
            Text(
              title,
              style: titleStyle ?? context.greyText,
            ),
            const VerticalSizedBox(8),
          ],
          AbsorbPointer(
            absorbing: onTapFunction != null,
            child: CustomBuilderTextFiled(
              onSubmit: onSubmit,
              onTap: function,
              radius: radius,
              controller: controller,
              hintText: title.isNotEmpty ? hint : null,
              label: title.isNotEmpty ? null : hint,
              readOnly: onTapFunction == null ? readOnly : true,
              inputAction: TextInputAction.newline,
              keyboardType: isOnlyNumber
                  ? TextInputType.number
                  : keyboard ?? TextInputType.multiline,
              format: isOnlyNumber
                  ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                  : [],
              obscureText: isPassword,
              onChange: onChange,
              maxLines: maxLine,
              suffixIcon: suffix,
              prefixIcon: prefix,
              fillColor: fillColor ?? AppColors.primaryColor,
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}
