import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar commonAppBar({required String title, bool darkMode = false}) {
  final titleColor = darkMode ? TaskiColors.stateBlue : TaskiColors.paleWhite;

  return AppBar(
    backgroundColor: darkMode ? TaskiColors.statePurple : TaskiColors.blue,
    leading: _closeButton(titleColor),
    title: Text(
      title,
      style: GoogleFonts.urbanist(
        color: titleColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}

Widget _closeButton(Color color) {
  return IconButton(
    icon: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: 1,
        ),
      ),
      child: Icon(Icons.close, color: color),
    ),
    onPressed: Get.back,
  );
}
