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
