import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elvateHub/core/routes/common_import.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    this.imageUrl,
    this.radius = 30,
    this.backgroundColor,
    this.child,
    this.imageFile,
  });

  final String? imageUrl;
  final File? imageFile;
  final double radius;
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius.r,
      backgroundImage: _buildImageProvider(),
      backgroundColor: backgroundColor ?? context.primaryColor,
      child: child,
    );
  }

  ImageProvider? _buildImageProvider() {
    if (imageFile != null) {
      return FileImage(imageFile!);
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      return NetworkImage(imageUrl!);
    }
    return null;
  }
}
