import 'package:elvateHub/core/routes/common_import.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 30.h,
        width: 30.w,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: context.primaryColor,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: 5.w,
          ),
          child: Icon(
            Icons.arrow_back_ios,
            color: context.scaffoldColor,
          ),
        ),
      ),
    );
  }
}
