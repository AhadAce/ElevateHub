import 'package:elvateHub/core/themes/context.dart';
import 'package:flutter/material.dart';

import '../cached/app_controller.dart';
import '../generated/l10n.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${S.of(context).welcome} ${AppController.instance.getUserModel().name}',
      style: context.mainTitle,
    );
  }
}
