import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class VerticalSizedBox extends StatelessWidget {
  const VerticalSizedBox(
    this.height, {
    Key? key,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}
