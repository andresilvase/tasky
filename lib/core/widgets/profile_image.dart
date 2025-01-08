import 'package:flutter/widgets.dart';
import 'dart:io';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.fit,
  });

  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;

  Widget fileImage(String imagePath) {
    return Image.file(
      fit: fit ?? BoxFit.cover,
      height: height ?? 40,
      width: width ?? 40,
      File(imagePath),
    );
  }

  Widget assetImage(String imagePath) {
    return Image.asset(
      fit: fit ?? BoxFit.cover,
      height: height ?? 40,
      width: width ?? 40,
      imagePath,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: imagePath.contains('assets') ? assetImage(imagePath) : fileImage(imagePath),
    );
  }
}
