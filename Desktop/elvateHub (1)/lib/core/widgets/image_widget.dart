import 'package:cached_network_image/cached_network_image.dart';
import 'package:elvateHub/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double? height, width;

  const ImageWidget({
    super.key,
    required this.image,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      )),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
    );
  }
}
