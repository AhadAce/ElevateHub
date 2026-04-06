import '../assets/assets.gen.dart';
import '../routes/common_import.dart';
import 'custom_divider.dart';
import 'horizontal_sized_box.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.label,
    required this.function,
    required this.isActive,
    this.isLogout = false,
  });
  final SvgGenImage icon;
  final String label;
  final void Function()? function;
  final bool isActive, isLogout;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (isActive) {
              Navigator.pop(context);
            } else {
              function?.call();
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            decoration: BoxDecoration(
              color: isLogout
                  ? null
                  : isActive
                      ? context.primaryColor
                      : null,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                icon.svg(
                  color: isLogout
                      ? AppColors.dangerColor
                      : isActive
                          ? context.scaffoldColor
                          : context.primaryColor,
                  height: 24.h,
                  width: 24.w,
                ),
                const HorizontalSizedBox(5),
                Text(
                  label,
                  style: context.smallTitle!.copyWith(
                    color: isLogout
                        ? AppColors.dangerColor
                        : isActive
                            ? context.scaffoldColor
                            : context.primaryColor,
                  ),
                ),
                if (!isLogout) ...[
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color:
                        isActive ? context.scaffoldColor : context.primaryColor,
                  ),
                ],
              ],
            ),
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
