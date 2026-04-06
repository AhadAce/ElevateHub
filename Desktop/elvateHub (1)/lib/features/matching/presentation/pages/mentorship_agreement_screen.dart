import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_back_button.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/matching/data/models/mentorship_model.dart';
import 'package:elvateHub/features/matching/presentation/cubit/create_mentorship_cubit.dart';

class MentorshipAgreementScreen extends StatefulWidget {
  const MentorshipAgreementScreen({
    super.key,
    required this.mentorshipModel,
  });
  final MentorshipModel mentorshipModel;
  @override
  State<MentorshipAgreementScreen> createState() =>
      _MentorshipAgreementScreenState();
}

class _MentorshipAgreementScreenState extends State<MentorshipAgreementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  const Spacer(),
                  Text(
                    S.of(context).mentorshipAgreement,
                    style: context.mainTitle,
                  ),
                  const Spacer(),
                ],
              ),
              const VerticalSizedBox(20),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightPrimaryColor,
                  borderRadius: BorderRadius.circular(
                    12.r,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 5.h,
                ),
                child: Text(
                  agreement,
                  style: context.subBody,
                ),
              ),
              const VerticalSizedBox(24),
              BlocConsumer<CreateMentorshipCubit, CreateMentorshipState>(
                listener: (context, state) {
                  if (state is CreateMentorshipSuccessState) {
                    customErrorToast(
                      context,
                      errorText: 'Mentorship Request sent!',
                      isSuccess: true,
                    );
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouter.main,
                      (_) => false,
                    );
                  }
                  if (state is CreateMentorshipErrorState) {
                    customErrorToast(context, errorText: state.errorMessage);
                  }
                },
                builder: (context, state) => AppBtn(
                  isLoading: state is CreateMentorshipLoadingState,
                  title: S.of(context).submitRequest,
                  function: () =>
                      CreateMentorshipCubit.get(context).createMentorship(
                    data: widget.mentorshipModel,
                  ),
                ),
              ),
              const VerticalSizedBox(24),
            ],
          ),
        ),
      ),
    );
  }

  String agreement = '''
Respectful Communication: 
I will communicate respectfully and professionally with
 my mentor, recognizing the mentor's time and expertise.

Commitment to Scheduled Meetings:
 I agree to attend scheduled sessions punctually. If a meeting needs to be postponed, I will notify my mentor in advance and work collaboratively to reschedule.

Goal Setting:
 I will work with my mentor to establish clear goals and objectives for the mentorship period and actively strive to achieve these goals.

Confidentiality:
 I will respect the privacy of my mentor and keep all shared personal, professional, and project-related information confidential, unless otherwise agreed.

Professional Conduct:
 I understand that this mentorship relationship is professional and will adhere to the agreed-upon guidelines and boundaries established at the beginning of the mentorship.

Feedback: 
I will provide honest feedback at the end of the mentorship to help improve future mentorship experiences within the platform
''';
}
