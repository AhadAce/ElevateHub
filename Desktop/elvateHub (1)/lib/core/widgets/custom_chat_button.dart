import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';

class CustomChatButton extends StatelessWidget {
  const CustomChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.allChat,
      ),
      child: Container(
        height: 30.h,
        width: 30.w,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: context.primaryColor,
        ),
        child: Icon(
          Icons.chat,
          color: context.scaffoldColor,
        ),
      ),
    );
  }
}
