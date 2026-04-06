import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl/intl.dart' as L;
import 'package:elvateHub/core/assets/assets.gen.dart';
import 'package:elvateHub/core/global_model/bottom_sheet_model.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import '../../features/community/presentation/cubit/report_post_cubit.dart';
import '../../features/community/presentation/pages/report_screen.dart';
import '../di/injector.dart';
import '../routes/app_router.dart';
import '../widgets/image_viewer_widget.dart';

String getLanguageStringFromCode({required String languageCode}) {
  Map<String, dynamic> language = {
    'ar': "اللغة العربية",
    'en': 'English',
  };
  return language[languageCode] ?? 'لا يوجد';
}

String formatTime(int seconds) {
  final int minutes = (seconds % 3600) ~/ 60;
  final int remainingSeconds = seconds % 60;
  return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
}

customErrorToast(
  BuildContext context, {
  required String errorText,
  bool isSuccess = false,
}) =>
    showToastWidget(
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Directionality(
          textDirection:
              context.isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 19.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.lightDangerColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  color: isSuccess
                      ? AppColors.successColor
                      : AppColors.dangerColor,
                ),
                const HorizontalSizedBox(10),
                Expanded(
                  child: Text(
                    errorText,
                    style: context.subBody!.copyWith(
                      color: isSuccess
                          ? AppColors.successColor
                          : AppColors.dangerColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      context: context,
      position: StyledToastPosition.top,
    );

defaultButtomSheet(BuildContext context,
        {required List<BottomSheetModel> actions}) =>
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: actions
              .map(
                (e) => CupertinoActionSheetAction(
                  onPressed: () => e.function(),
                  child: Text(
                    e.title,
                  ),
                ),
              )
              .toList(),
          cancelButton: AppBtn(
            width: double.infinity,
            title: 'cancel',
            function: () => Navigator.pop(context),
          ),
        );
      },
    );
String getTimeAMPMFromString(String date) {
  if (int.parse(date.split(':')[0]) > 12) {
    return '${int.parse(date.split(':')[0]) - 12}:00 مساءًا';
  } else {
    return '${int.parse(date.split(':')[0])}:00 صباحًا';
  }
}

String getGoodMorningOrAfterNoon(BuildContext context) {
  final L.DateFormat formatter =
      L.DateFormat.jm('en'); // 'jm' stands for 'h:mm a'
  if (formatter.format(DateTime.now()).contains('PM')) {
    return S.of(context).goodAfterNoon;
  }
  return S.of(context).goodMorning;
}

String dateToString(DateTime date) =>
    L.DateFormat('yyyy-MM-dd', 'en_US').format(date);

bool isToday(DateTime dateTime) {
  final now = DateTime.now();
  return now.year == dateTime.year &&
      now.month == dateTime.month &&
      now.day == dateTime.day;
}

String formatMessageTime(DateTime dateTime) {
  return L.DateFormat('HH:mm', 'en_US').format(dateTime);
}

String formatMessageDay(DateTime dateTime) {
  return L.DateFormat.yMMMMd('en_US').format(dateTime);
}

String dayHistoryToString(DateTime date) => L.DateFormat('EEEE').format(date);

bool isEmailValid(String email) {
  // Regular expression to validate email
  String emailPattern =
      r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+(\.[a-zA-Z]+)?$';
  RegExp regex = RegExp(emailPattern);
  return regex.hasMatch(email);
}

Future<DateTime?> selectDate(BuildContext context,
    {DateTime? from, DateTime? to}) async {
  return await showDatePicker(
    context: context,
    initialDate: to,
    firstDate: from ?? DateTime.now(),
    lastDate: to ?? DateTime.now().add(const Duration(days: 30)),
  );
}

showExitPopup(BuildContext context) async {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return SizedBox(
          height: 275.h,
          child: Stack(
            children: [
              PositionedDirectional(
                start: 0,
                end: 0,
                bottom: 0,
                child: Container(
                  height: 258.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      const VerticalSizedBox(28),
                      Text(
                        S.of(context).youNeedLogout,
                        style: context.subTitle,
                      ),
                      const VerticalSizedBox(45),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  exit(0);
                                },
                                child: Container(
                                  height: 47.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      S.of(context).yes,
                                      style: context.subBody!.copyWith(
                                          color: context.scaffoldColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Center(
                                  child: Text(
                                    S.of(context).no,
                                    style: context.subBody,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PositionedDirectional(
                top: 0,
                start: 18.w,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Assets.images.exit.svg(),
                ),
              ),
            ],
          ),
        );
      });
}

customDialog(
  BuildContext context, {
  required Widget icon,
  required String title,
  required String yesButtonText,
  required String noButtonText,
  required VoidCallback yesFunction,
}) =>
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              )),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const VerticalSizedBox(10),
              Center(
                child: Text(
                  title,
                  style: context.mainTitle,
                ),
              ),
              const VerticalSizedBox(31),
              AppBtn(
                function: yesFunction,
                title: yesButtonText,
              ),
              const VerticalSizedBox(12),
              AppBtn(
                function: () {
                  Navigator.pop(context);
                },
                title: noButtonText,
                btnColor: Colors.transparent,
                textColor: AppColors.primaryTextColor,
              ),
            ],
          ),
        );
      },
    );
logoutFunction(BuildContext context) async {
  await AppController.instance.logout();
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushNamedAndRemoveUntil(AppRouter.startedApp, (route) => false);
}

UserType getUserType(String id) {
  UserType type = UserType.user;
  switch (id) {
    case 'user':
      type = UserType.user;
      break;
    case 'contributor':
      type = UserType.contributor;
      break;
    case 'admin':
      type = UserType.admin;
      break;
    default:
      type = UserType.user;
  }
  return type;
}

logoutDialog(
  BuildContext context,
) {
  return customDialog(
    context,
    icon: Assets.images.logout2.svg(),
    title: S.of(context).youNeedLogout,
    yesButtonText: S.of(context).yes,
    noButtonText: S.of(context).no,
    yesFunction: () => logoutFunction(context),
  );
}

bool isCustomer() =>
    AppController.instance.getUserModel().type == UserType.user;
bool isAdmin() => AppController.instance.getUserModel().type == UserType.admin;

navigateToImageViewer(
  BuildContext context, {
  required bool isFile,
  File? file,
  String? path,
  required String tag,
}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageViewerWidget(
          isFile: isFile,
          tag: tag,
          file: file,
          path: path,
        ),
      ),
    );

Future<bool> confirmationSheet(
  BuildContext context,
  String title,
  List<Widget> buttons, {
  bool showGreyScrollButton = false,
  EdgeInsetsGeometry? padding,
  bool? dismissible,
}) async {
  bool closed = false;
  await showModalBottomSheet(
    context: context,
    enableDrag: dismissible ?? true,
    isScrollControlled: dismissible ?? showGreyScrollButton,
    isDismissible: dismissible ?? showGreyScrollButton,
    barrierColor: showGreyScrollButton ? null : AppColors.lightGreyColor,
    backgroundColor: Colors.transparent,
    shape: const OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(32),
        topLeft: Radius.circular(32),
      ),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    builder: (context) => !showGreyScrollButton
        ? SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 5.h,
                horizontal: 2.w,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                border: Border.all(color: Colors.white),
              ),
              child: Padding(
                padding: padding ?? EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: context.mainTitle,
                    ),
                    ...buttons,
                  ],
                ),
              ),
            ),
          )
        : LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                constraints: BoxConstraints(
                  maxHeight: 90.h,
                ),
                padding: EdgeInsets.fromLTRB(
                  2.w,
                  5.h,
                  2.w,
                  0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: padding ?? EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 6,
                          width: 20.w,
                          margin: EdgeInsets.only(bottom: 3.h),
                          decoration: BoxDecoration(
                            color: AppColors.lightGreyColor.withOpacity(0.13),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Text(
                          title,
                          style: context.mainTitle,
                        ),
                        SizedBox(height: 2.h),
                        ...buttons,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
  ).then((value) {
    closed = true;
  });
  return closed;
}

void reportReasonDialog(
  BuildContext context, {
  required String postId,
}) {
  showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => ReportPostCubit(
        getIt(),
      ),
      child: ReportScreen(
        postId: postId,
      ),
    ),
  );
}
