import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/constants/colors.dart';

class IconSvg extends StatelessWidget {
  const IconSvg({
    super.key,
    required this.assetName,
    this.semanticsLabel,
    this.size,
    this.color,
  });

  final String? semanticsLabel;
  final String assetName;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      semanticsLabel: semanticsLabel,
      width: size,
      assetName,
      colorFilter: ColorFilter.mode(
        color ?? TaskyColors.mutedAzure,
        BlendMode.srcIn,
      ),
    );
  }
}
