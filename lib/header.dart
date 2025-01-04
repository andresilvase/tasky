import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        spacing: 32,
        children: [
          _logoProfile(),
          _welcomeHeader(),
        ],
      ),
    );
  }

  Widget _welcomeHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeMessage(),
          _taskSummary(),
        ],
      ),
    );
  }

  Widget _welcomeMessage() {
    return Row(
      spacing: 8,
      children: [
        Text(
          'Welcome,',
          style: GoogleFonts.urbanist(
            color: TaskyColors.statePurple,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          'André',
          style: GoogleFonts.urbanist(
            color: TaskyColors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _taskSummary() {
    return Row(
      spacing: 8,
      children: [
        Text(
          'You\'ve got',
          style: GoogleFonts.urbanist(
            color: TaskyColors.stateBlue,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        Text(
          '5 tasks',
          style: GoogleFonts.urbanist(
            color: TaskyColors.stateBlue,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        Text(
          'to do.',
          style: GoogleFonts.urbanist(
            color: TaskyColors.stateBlue,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ],
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
