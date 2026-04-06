import 'package:elvateHub/core/assets/assets.gen.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.icon, required this.emptyText});
  final SvgGenImage icon;
  final String emptyText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightPrimaryColor.withOpacity(0.04),
            radius: 80.r,
            child: Center(
              child: icon.svg(
                height: 73.h,
                width: 73.w,
              ),
            ),
          ),
          const VerticalSizedBox(20),
          Text(
            emptyText,
            style: context.subTitle!.copyWith(
              color: context.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
