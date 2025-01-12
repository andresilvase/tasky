import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:tasky/core/constants/assets.dart';
import 'package:tasky/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoTask extends StatelessWidget {
  const NoTask({
    super.key,
    this.showCreateTaskButton = true,
    this.onNewTask,
    this.feedback,
  });

  final bool showCreateTaskButton;
  final Function()? onNewTask;
  final String? feedback;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          feedbackImage(),
          createTaskButton(context),
        ],
      ),
    );
  }

  Widget feedbackImage() {
    return Column(
      spacing: 24,
      children: [
        Image.asset(TaskiAssets.noTask),
        Text(
          feedback ?? AppLocalizations.of(Get.context!)!.youHaveNoTaskListed,
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.normal,
            color: TaskiColors.stateBlue,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget createTaskButton(BuildContext context) {
    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;

    return Visibility(
      visible: showCreateTaskButton,
      child: ElevatedButton.icon(
        key: Key(WidgetKeys.createTaskButton),
        label: Text(
          AppLocalizations.of(Get.context!)!.createTask,
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w600,
            color: isDarkMode ? TaskiColors.blue10 : TaskiColors.blue,
            fontSize: 18,
          ),
        ),
        icon: Icon(Icons.add, color: isDarkMode ? TaskiColors.blue10 : TaskiColors.blue),
        style: buttonStyle(isDarkMode),
        onPressed: onNewTask,
      ),
    );
  }

  ButtonStyle buttonStyle(bool isDarkMode) {
    return ElevatedButton.styleFrom(
      backgroundColor: isDarkMode ? TaskiColors.statePurple : TaskiColors.blue10,
      padding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
    );
  }
}
