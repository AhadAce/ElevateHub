import 'package:flutter/material.dart';
import 'package:elvateHub/core/helpers/helper_function.dart';

class CustomValidator {
  static bool validateTextFields({
    required BuildContext context,
    required List<TextEditingController> controllers,
    required List<String> errorMessages,
  }) {
    for (int i = 0; i < controllers.length; i++) {
      if (controllers[i].text.trim().isEmpty) {
        customErrorToast(context, errorText: errorMessages[i]);
        return false;
      }
    }
    return true;
  }

  static bool specialValidation({
    required BuildContext context,
    required Map<String, bool> map,
  }) {
    for (int i = 0; i < map.length; i++) {
      if (!map.values.toList()[i]) {
        customErrorToast(
          context,
          errorText: map.keys.toList()[i],
        );
        return false;
      }
    }

    return true;
  }
}
