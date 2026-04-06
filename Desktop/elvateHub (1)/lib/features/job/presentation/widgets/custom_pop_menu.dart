import 'package:elvateHub/core/routes/app_router.dart';

import '../../../../core/routes/common_import.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      color: AppColors.lightPrimaryColor, // Green background
      icon: const Icon(Icons.more_vert, color: Colors.black),
      onSelected: (value) {
        // Handle menu selection
        if (value == 1) {
          Navigator.pushNamed(
            context,
            AppRouter.application,
          );
        } else if (value == 2) {
          // About Your Company
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text(
            S.of(context).applications,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        // const PopupMenuItem(
        //   value: 2,
        //   child: Text(
        //     "About Your Company..",
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
      ],
    );
  }
}
