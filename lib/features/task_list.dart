import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/core/constants/colors.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return _welcomeHeader();
  }

  Widget _welcomeHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      color: TaskyColors.redShade,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32),
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
}
