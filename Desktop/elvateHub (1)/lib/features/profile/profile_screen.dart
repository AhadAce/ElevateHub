import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_avatar_widget.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Widget> _firstList = [];
  List<Widget> _secondList = [];
  List<Widget> _thirdList = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _firstList = [
      _customTapWidget(
        context,
        lable: S.of(context).editProfileTap,
        icon: Icons.card_membership,
      ),
      _customTapWidget(
        context,
        lable: S.of(context).notificationTap,
        icon: Icons.notifications,
      ),
      _customTapWidget(
        context,
        lable: S.of(context).language,
        icon: Icons.language,
        subLabel: S.of(context).english,
      ),
      _customTapWidget(
        context,
        lable: S.of(context).manageTap,
        icon: Icons.manage_accounts,
      ),
    ];

    _secondList = [
      _customTapWidget(
        context,
        lable: S.of(context).securityTap,
        icon: Icons.security,
      ),
      _customTapWidget(
        context,
        lable: S.of(context).thememTap,
        icon: Icons.brightness_1,
        subLabel: S.of(context).lightMode,
      ),
    ];

    _thirdList = [
      _customTapWidget(
        context,
        lable: S.of(context).helpTap,
        icon: Icons.help,
      ),
      _customTapWidget(
        context,
        lable: S.of(context).contactUsTap,
        icon: Icons.contact_emergency,
      ),
      _customTapWidget(
        context,
        lable: S.of(context).privacyAndSecurity,
        icon: Icons.privacy_tip,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          children: [
            Center(
              child: CustomAvatarWidget(
                avatar: context.user.image ?? '',
                radius: 60,
              ),
            ),
            const VerticalSizedBox(10),
            Text(
              context.user.name,
              style: context.mainTitle!.copyWith(
                color: context.primaryColor,
              ),
            ),
            const VerticalSizedBox(5),
            Text(
              '${context.user.email} | +966${context.user.mobileNumber}',
              style: context.smallBody!.copyWith(
                color: context.primaryColor,
              ),
            ),
            const VerticalSizedBox(20),
            _customContainer(context, _firstList),
            const VerticalSizedBox(15),
            _customContainer(context, _secondList),
            const VerticalSizedBox(15),
            _customContainer(context, _thirdList),
            const VerticalSizedBox(15),
            GestureDetector(
              onTap: () async => logoutFunction(context),
              child: Text(
                S.of(context).logout,
                style: context.subTitle!.copyWith(
                  color: AppColors.dangerColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customContainer(BuildContext context, List<Widget> list) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: context.primaryColor,
        ),
        child: Column(
          children: list,
        ),
      );

  Widget _customTapWidget(
    BuildContext context, {
    required String lable,
    String? subLabel,
    required IconData icon,
  }) =>
      Padding(
        padding: EdgeInsetsDirectional.only(bottom: 8.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: context.scaffoldColor,
            ),
            const HorizontalSizedBox(10),
            Text(
              lable,
              style: context.subBody!.copyWith(
                color: context.scaffoldColor,
              ),
            ),
            const Spacer(),
            if (subLabel != null)
              Text(
                subLabel,
                style: context.subBody!.copyWith(
                  color: context.scaffoldColor,
                ),
              ),
          ],
        ),
      );
}
