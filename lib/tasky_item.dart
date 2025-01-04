import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:tasky/colors.dart';
import 'package:get/get.dart';

class TaskyItem extends StatelessWidget {
  const TaskyItem({super.key, this.description, this.title});

  final String? description;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return _builder();
  }

  Widget _builder() {
    return _background();
  }

  Widget _background() {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: TaskyColors.paleWhite,
      ),
      child: _contentBuilder(),
    );
  }

  Widget _contentBuilder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _titleBuilder(),
        _description(),
      ],
    );
  }

  Widget _titleBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: _title(),
    );
  }

  Widget _title() {
    return Row(
      children: [
        Checkbox(
          visualDensity: const VisualDensity(vertical: -4),
          activeColor: TaskyColors.blue,
          checkColor: TaskyColors.white,
          onChanged: (_) {},
          value: false,
          side: const BorderSide(
            color: TaskyColors.mutedAzure,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Text(
          'Design sign up flow',
          style: GoogleFonts.urbanist(
            color: TaskyColors.statePurple,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _description() {
    return Visibility(
      visible: description != null,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 32),
            width: Get.width * 0.76,
            child: Text(
              description ?? "",
              style: GoogleFonts.urbanist(
                color: TaskyColors.stateBlue,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              textAlign: TextAlign.justify,
              maxLines: 4,
            ),
          ),
          const SizedBox(height: 4)
        ],
      ),
    );
  }
}
