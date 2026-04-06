import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_back_button.dart';
import 'package:elvateHub/core/widgets/title%20_text_field_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/matching/data/models/mentorship_model.dart';

class MentorshipDetailsScreen2 extends StatefulWidget {
  const MentorshipDetailsScreen2({
    super.key,
    required this.mentorshipModel,
  });
  final MentorshipModel mentorshipModel;
  @override
  State<MentorshipDetailsScreen2> createState() =>
      _MentorshipDetailsScreen2State();
}

class _MentorshipDetailsScreen2State extends State<MentorshipDetailsScreen2> {
  late TextEditingController _goalController;
  bool agree = false;
  @override
  void initState() {
    super.initState();
    _goalController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _goalController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            TitleTextFieldWidget(
              hint: S.of(context).writeHere,
              controller: _goalController,
              title: S.of(context).anySpecificGoals,
              maxLine: 5,
            ),
            const VerticalSizedBox(16),
            Text(
              S.of(context).agreement,
              style: context.greyText,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: agree,
              onChanged: (val) {
                agree = val ?? false;
                setState(() {});
              },
              title: Text(
                S.of(context).agreementDetails,
              ),
            ),
            const VerticalSizedBox(24),
            AppBtn(
              title: S.of(context).next,
              function: () {
                MentorshipModel mentorshipModel =
                    widget.mentorshipModel.copyWith(
                  goal: _goalController.text,
                );
                Navigator.pushNamed(
                  context,
                  AppRouter.mentorshipAgreement,
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
