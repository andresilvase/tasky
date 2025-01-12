import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tasky/features/auth/widgets/input_text.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:tasky/features/tasks/model/task.dart';
import 'package:tasky/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../viewModel/task_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _descriptionFocus = FocusNode();
  final FocusNode _titleFocus = FocusNode();

  @override
  void initState() {
    _titleFocus.addListener(() => setState(() {}));
    _descriptionFocus.addListener(() => setState(() {}));

    super.initState();
  }

  Task get task {
    return Task(
      description: _descriptionController.text,
      title: _titleController.text,
      date: DateTime.now(),
      isCompleted: false,
      id: '',
    );
  }

  void createTask() {
    final TaskViewModel taskViewModel = Get.find();
    taskViewModel.addTask(task);

    _titleController.clear();
    _descriptionController.clear();

    _descriptionFocus.unfocus();
    Get.back();
  }

  String? validateTitleInput(value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.titleRequired;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? null : TaskiColors.paleWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.all(40),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          Text(
            AppLocalizations.of(context)!.createTask,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
          _title(isDarkMode),
          _description(isDarkMode),
          _createButton(),
        ],
      ),
    );
  }

  Widget _title(bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Form(
        key: _formKey,
        child: InputText(
          labelText: AppLocalizations.of(context)!.whatsInYourMind,
          key: Key(WidgetKeys.createTaskTitleInput),
          prefixWidget: _titlePrefixIcon(),
          validator: validateTitleInput,
          controller: _titleController,
          isDarkMode: isDarkMode,
          focusNode: _titleFocus,
        ),
      ),
    );
  }

  Transform _titlePrefixIcon() {
    return Transform.scale(
      scale: 1.25,
      child: Checkbox(
        visualDensity: VisualDensity(vertical: -4),
        checkColor: TaskiColors.white,
        onChanged: null,
        value: false,
        side: BorderSide(
          color: TaskiColors.mutedAzure,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _description(bool isDarkMode) {
    return Container(
      margin: EdgeInsets.only(top: _descriptionFocus.hasFocus ? 32 : 0),
      child: InputText(
        labelText: AppLocalizations.of(context)!.addNote,
        key: Key(WidgetKeys.createTaskDescriptionInput),
        controller: _descriptionController,
        focusNode: _descriptionFocus,
        prefixIcon: Icons.edit,
        isDarkMode: isDarkMode,
        maxLines: 2,
      ),
    );
  }

  Widget _createButton() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      alignment: Alignment.centerRight,
      child: TextButton(
        key: Key(WidgetKeys.createTaskSubmitButton),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            createTask();
          }
        },
        child: Text(
          AppLocalizations.of(context)!.create,
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.bold,
            color: TaskiColors.blue,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
