import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/core/constants/colors.dart';

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
            fillColor: WidgetStateProperty.all(TaskyColors.blue),
            visualDensity: VisualDensity(vertical: -4),
            checkColor: TaskyColors.white,
            onChanged: null,
            value: true,
            side: BorderSide(
              color: TaskyColors.mutedAzure,
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
            color: TaskyColors.statePurple,
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
          'André',
          style: GoogleFonts.urbanist(
            color: TaskyColors.statePurple,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        ClipOval(
          child: Image.asset(
            'assets/images/Linkedin.png',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
