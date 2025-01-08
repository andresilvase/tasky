import 'package:taski/core/constants/assets.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:taski/core/widgets/icon_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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

OutlineInputBorder errorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color: TaskiColors.redShade,
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
        margin: const EdgeInsets.only(right: 8),
        child: IconSvg(
          assetName: TaskiAssets.close,
          size: 40,
        ),
      ),
    ),
  );
}

Color inputBorderColor({required bool focusNodeHasFocus, required bool isInErrorState}) {
  if (isInErrorState) {
    return TaskiColors.redShade;
  } else if (focusNodeHasFocus) {
    return TaskiColors.blue;
  } else {
    return TaskiColors.mutedAzure;
  }
}

TextStyle inputTextStyle(Color color, {double fontSize = 16}) {
  return GoogleFonts.urbanist(
    fontWeight: FontWeight.normal,
    fontSize: fontSize,
    color: color,
  );
}
