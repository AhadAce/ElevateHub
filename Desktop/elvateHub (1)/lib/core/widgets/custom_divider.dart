import 'package:elvateHub/core/routes/common_import.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.height,
    this.color,
    this.thickness,
  });
  final double? height, thickness;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height?.h,
      color: color ?? AppColors.greyFiledBoarderColor,
      thickness: thickness ?? 1.5,
    );
  }
}
