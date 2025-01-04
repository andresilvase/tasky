import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/core/constants/colors.dart';

class NoTask extends StatelessWidget {
  const NoTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/no-task.png'),
          Text(
            'You have no task listed.',
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.normal,
              color: TaskyColors.stateBlue,
              fontSize: 16,
            ),
          ),
          ElevatedButton.icon(
            label: Text(
              'Create Task',
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w600,
                color: TaskyColors.blue,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.add, color: TaskyColors.blue),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: TaskyColors.blue10,
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
