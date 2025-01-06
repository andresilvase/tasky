import 'package:taski/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class LoadingBlur extends StatelessWidget {
  const LoadingBlur({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: TaskiColors.stateBlue.withValues(alpha: .5),
          child: Center(
            child: child ?? const CircularProgressIndicator(color: TaskiColors.paleWhite),
          ),
        ),
      ),
    );
  }
}
