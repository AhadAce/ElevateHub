import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_container.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/vertical_sized_box.dart';
import '../../../../core/widgets/welcome_widget.dart';

class SelectCommunityScreen extends StatelessWidget {
  const SelectCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const VerticalSizedBox(30),
            const WelcomeWidget(),
            const VerticalSizedBox(20),
            Text(
              S.of(context).selectCommunity,
              style: context.subBody,
            ),
            const VerticalSizedBox(20),
            CustomContainer(
              label: S.of(context).publicCommunity,
              function: () => Navigator.pushNamed(
                context,
                AppRouter.community,
              ),
            ),
            if (context.user.gender == Gender.female)
              CustomContainer(
                label: S.of(context).womenInTechCommunity,
                function: () => Navigator.pushNamed(
                  context,
                  AppRouter.community,
                  arguments: true,
                ),
              ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
