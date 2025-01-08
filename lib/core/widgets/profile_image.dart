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

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.file(
        fit: fit ?? BoxFit.cover,
        File(imagePath),
        height: height ?? 40,
        width: width ?? 40,
      ),
    );
  }
}
