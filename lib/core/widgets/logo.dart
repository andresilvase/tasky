import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            fillColor: WidgetStateProperty.all(TaskiColors.blue),
            visualDensity: VisualDensity(vertical: -4),
            checkColor: TaskiColors.white,
            onChanged: null,
            value: true,
            side: BorderSide(
              color: TaskiColors.mutedAzure,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Text(
          AppLocalizations.of(Get.context!)!.appName,
          style: GoogleFonts.urbanist(
            color: isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
