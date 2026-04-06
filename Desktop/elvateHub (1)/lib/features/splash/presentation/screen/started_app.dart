import 'package:elvateHub/core/assets/assets.gen.dart';
import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';

class StartedApp extends StatelessWidget {
  const StartedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 26.w,
                  vertical: 15.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColors.primaryDarkColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.images.logoPng.image(
                      height: 177.h,
                      width: 176.w,
                    ),
                    Text(
                      S.of(context).startedAppDesc1,
                      style: context.mainTitle!.copyWith(
                        color: context.scaffoldColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      S.of(context).startedAppDesc2,
                      style: context.mainTitle!.copyWith(
                        color: context.scaffoldColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const VerticalSizedBox(10),
                    Row(
                      children: [
                        Expanded(
                          child: AppBtn(
                            title: S.of(context).login,
                            function: () => Navigator.pushNamed(
                              context,
                              AppRouter.login,
                            ),
                            btnColor: context.scaffoldColor,
                            textColor: AppColors.blackColor,
                          ),
                        ),
                        const HorizontalSizedBox(10),
                        Expanded(
                          child: AppBtn(
                            title: S.of(context).registerNow,
                            function: () => Navigator.pushNamed(
                              context,
                              AppRouter.registerOrUpdate,
                            ),
                            btnColor: context.scaffoldColor,
                            textColor: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    const VerticalSizedBox(20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
