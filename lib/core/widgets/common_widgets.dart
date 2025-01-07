import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar commonAppBar(String title) {
  return AppBar(
    backgroundColor: TaskiColors.blue,
    leading: _closeButton(),
    title: Text(
      title,
      style: GoogleFonts.urbanist(
        color: TaskiColors.paleWhite,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}

Widget _closeButton() {
  return IconButton(
    icon: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: TaskiColors.paleWhite,
          width: 1,
        ),
      ),
      child: Icon(Icons.close, color: TaskiColors.paleWhite),
    ),
    onPressed: Get.back,
  );
}
