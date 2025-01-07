import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.height,
    required this.width,
    required this.text,
    this.onPressed,
  });

  final Color backgroundColor;
  final Function()? onPressed;
  final Color textColor;
  final double height;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
