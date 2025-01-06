import 'package:taski/core/constants/assets.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: _logoProfile(),
    );
  }

  Widget _logoProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logo(),
        _profile(),
      ],
    );
  }

  Widget _logo() {
    return Row(
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
          'Taski',
          style: GoogleFonts.urbanist(
            color: TaskiColors.statePurple,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _profile() {
    return Row(
      spacing: 16,
      children: [
        Text(
          // TODO: Change to user name
          'André',
          style: GoogleFonts.urbanist(
            color: TaskiColors.statePurple,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        ClipOval(
          child: Image.asset(
            TaskiAssets.imageProfile,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
