import 'package:taski/core/constants/assets.dart';
import 'package:taski/core/widgets/icon_svg.dart';
import 'package:flutter/material.dart';

OutlineInputBorder noBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(style: BorderStyle.none),
    borderRadius: BorderRadius.zero,
  );
}

OutlineInputBorder activeBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      style: BorderStyle.solid,
      color: color,
      width: 2,
    ),
  );
}

Widget suffixIcon({bool visible = true, void Function()? onPressed}) {
  return Visibility(
    visible: visible,
    child: IconButton(
      onPressed: onPressed,
      icon: Container(
        margin: const EdgeInsets.only(right: 4),
        child: IconSvg(
          assetName: TaskiAssets.close,
          size: 32,
        ),
      ),
    ),
  );
}
