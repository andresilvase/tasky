import 'package:taski/core/constants/colors.dart';
import 'package:flutter/material.dart';

class PopUpMessage extends StatelessWidget {
  const PopUpMessage({
    super.key,
    this.backGroundColor,
    this.denyText = '',
    this.confirmAction,
    this.confirmText,
    this.denyAction,
    this.textColor,
    this.message,
    this.title,
  });

  final void Function()? confirmAction;
  final void Function()? denyAction;
  final Color? backGroundColor;
  final String? confirmText;
  final Color? textColor;
  final String denyText;
  final String? message;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backGroundColor ?? TaskiColors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(
        '$title',
        style: TextStyle(color: textColor ?? TaskiColors.white, fontSize: 16),
      ),
      content: Text(
        '$message',
        style: TextStyle(
          color: textColor ?? TaskiColors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      actions: <Widget>[
        confirmAction != null
            ? TextButton(
                onPressed: () => confirmAction?.call(),
                child: Text(
                  '$confirmText',
                  style: TextStyle(color: textColor ?? TaskiColors.white),
                ),
              )
            : Container(),
        denyAction != null
            ? TextButton(
                onPressed: () => denyAction?.call(),
                child: Text(
                  denyText,
                  style: TextStyle(color: textColor ?? TaskiColors.white),
                ),
              )
            : Container()
      ],
    );
  }
}
