import 'package:taski/features/tasks/views/create_task.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

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
              color: TaskiColors.stateBlue,
              fontSize: 16,
            ),
          ),
          ElevatedButton.icon(
            label: Text(
              'Create Task',
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w600,
                color: TaskiColors.blue,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.add, color: TaskiColors.blue),
            onPressed: () {
              showModalBottomSheet(context: context, builder: (context) => CreateTask());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: TaskiColors.blue10,
              padding: const EdgeInsets.all(12),
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
