import 'package:elvateHub/core/helpers/constant.dart';
import 'package:elvateHub/core/helpers/string_constant.dart';
import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_back_button.dart';
import 'package:elvateHub/core/widgets/drop_down_widget.dart';
import 'package:elvateHub/core/widgets/title%20_text_field_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/matching/data/models/mentorship_model.dart';

import '../../../../core/global_bloc/drop_list/drop_list_cubit.dart';

class MentorshipDetailsScreen extends StatefulWidget {
  const MentorshipDetailsScreen({
    super.key,
    required this.mentorshipModel,
  });
  final MentorshipModel mentorshipModel;
  @override
  State<MentorshipDetailsScreen> createState() =>
      _MentorshipDetailsScreenState();
}

class _MentorshipDetailsScreenState extends State<MentorshipDetailsScreen> {
  late TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                const CustomBackButton(),
                const Spacer(),
                Text(
                  S.of(context).mentorshipRequestDetails,
                  style: context.mainTitle,
                ),
                const Spacer(),
              ],
            ),
            const VerticalSizedBox(20),
            DropDownWidget(
              keyStr: durationKey,
              list: duration,
              value: DropListCubit.dropListValue[durationKey]?.name ??
                  S.of(context).selectDuration,
              title: S.of(context).duration,
              needTitle: true,
            ),
            DropDownWidget(
              keyStr: purposeKey,
              list: purpose,
              value: DropListCubit.dropListValue[purposeKey]?.name ??
                  S.of(context).selectPurpose,
              title: S.of(context).purpose,
              needTitle: true,
            ),
            const VerticalSizedBox(16),
            TitleTextFieldWidget(
              hint: S.of(context).writeHere,
              controller: _noteController,
              title: S.of(context).another,
            ),
            const VerticalSizedBox(24),
            AppBtn(
              title: S.of(context).next,
              function: () {
                MentorshipModel mentorshipModel =
                    widget.mentorshipModel.copyWith(
                  purpose: DropListCubit.dropListValue[purposeKey]?.id,
                  duration: DropListCubit.dropListValue[durationKey]?.id,
                  note: _noteController.text,
                );
                Navigator.pushNamed(
                  context,
                  AppRouter.mentorshipDetails2,
                  arguments: mentorshipModel,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
