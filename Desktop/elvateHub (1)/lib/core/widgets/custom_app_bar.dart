import '../assets/assets.gen.dart';
import '../routes/common_import.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(65.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: widget.backgroundColor ?? AppColors.scaffoldColor,
    //   statusBarIconBrightness: Brightness.light,
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(
        65.h,
      ),
      child: Assets.images.appBar.image(
        width: double.infinity,
        height: 65.h,
      ),
    );
  }
}
