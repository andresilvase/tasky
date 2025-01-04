import 'package:get/get.dart';
import 'package:tasky/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:tasky/tasky_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _welcomeHeader(),
        Expanded(
          child: ListView(
            children: [
              TaskyItem(title: 'Buy groceries', description: 'Buy milk, eggs, and bread'),
              TaskyItem(title: 'Call mom', description: 'Call mom to wish her a happy birthday'),
              TaskyItem(title: 'Go to the gym', description: 'Work out for 1 hour'),
              TaskyItem(title: 'Read a book', description: 'Read 50 pages of "Atomic Habits"'),
              TaskyItem(title: 'Watch a movie', description: ''),
              TaskyItem(title: 'Go for a walk', description: ''),
              TaskyItem(title: 'Write a blog post', description: ''),
              TaskyItem(title: 'Clean the house', description: ''),
              TaskyItem(title: 'Do the laundry', description: ''),
              TaskyItem(title: 'Water the plants', description: ''),
              SizedBox(height: Get.width * 0.5),
            ],
          ),
        ),
      ],
    );
  }

  Widget _welcomeHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
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
