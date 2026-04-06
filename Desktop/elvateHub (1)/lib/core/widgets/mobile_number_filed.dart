import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_builder_text_field.dart';

import 'vertical_sized_box.dart';

class MobileNumberFiled extends StatelessWidget {
  const MobileNumberFiled({
    super.key,
    required this.controller,
    this.needTitle = false,
    this.readOnly = false,
    this.hint,
    this.titleTextStyle,
  });

  final TextEditingController? controller;
  final bool needTitle, readOnly;
  final String? hint;
  final TextStyle? titleTextStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (needTitle) ...[
          Text(
            S.of(context).mobileNumberHint,
            style: titleTextStyle ?? context.smallTitle,
          ),
          const VerticalSizedBox(8),
        ],
        Directionality(
          textDirection: TextDirection.ltr,
          child: CustomBuilderTextFiled(
            controller: controller,
            hintText: hint ?? S.of(context).mobileNumberHint,
            readOnly: readOnly,
            inputAction: TextInputAction.newline,
            keyboardType: TextInputType.number,
            maxLength: 9,
            format: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            prefixIcon: Container(
              transform: Matrix4.translationValues(15.0, 0.0, 0.0),
              child: CountryCodePicker(
                padding: EdgeInsets.zero,
                onChanged: (CountryCode code) {},
                initialSelection: '+966',
                showCountryOnly: false,
                enabled: false,
                textStyle: context.subBody,
                showOnlyCountryWhenClosed: false,
                favorite: const ['+966'],
              ),
            ),
            filled: true,
            fillColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
