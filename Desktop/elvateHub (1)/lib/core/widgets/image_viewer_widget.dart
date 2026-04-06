import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewerWidget extends StatelessWidget {
  const ImageViewerWidget(
      {super.key,
      required this.isFile,
      this.file,
      this.path,
      required this.tag});
  final bool isFile;
  final File? file;
  final String? path;
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: tag,
        child: isFile
            ? PhotoView(imageProvider: FileImage(file ?? File('')))
            : PhotoView(
                imageProvider: AssetImage(path ?? ''),
              ),
      ),
    );
  }
}
