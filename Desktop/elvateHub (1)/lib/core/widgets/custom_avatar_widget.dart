import 'dart:io';

import 'package:elvateHub/core/helpers/string_constant.dart';
import 'package:elvateHub/core/routes/common_import.dart';

class CustomAvatarWidget extends StatelessWidget {
  const CustomAvatarWidget({
    super.key,
    this.avatar,
    this.radius = 40,
    this.backgroundColor,
    this.avatarFile,
    this.child,
  });

  final String? avatar;
  final File? avatarFile;
  final double radius;
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final String avatarUrl =
        (avatar != null && avatar!.trim().isNotEmpty) ? avatar! : defaultAvatar;

    return avatarFile == null
        ? CircleAvatar(
            radius: radius.r,
            backgroundColor: backgroundColor ?? context.primaryColor,
            backgroundImage: NetworkImage(avatarUrl),
            child: child,
          )
        : CircleAvatar(
            radius: radius.r,
            backgroundColor: backgroundColor ?? context.primaryColor,
            backgroundImage: FileImage(avatarFile!),
            child: child,
          );
  }
}
