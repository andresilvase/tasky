import 'package:taski/core/widgets/text_field_common_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:taski/features/tasks/model/task.dart';
import 'package:taski/core/constants/colors.dart';
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

  @override
  void initState() {
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
      margin: EdgeInsets.only(right: 40, left: 40, top: 16),
      child: Column(
        children: [
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
        child: TextFormField(
          key: Key(WidgetsKeys.createTaskTitleInput),
          cursorErrorColor: TaskiColors.redShade,
          decoration: _titleInputDecoration(),
          style: _titleTextStyle(isDarkMode),
          validator: validateTitleInput,
          controller: _titleController,
        ),
      ),
    );
  }

  InputDecoration _titleInputDecoration() {
    return InputDecoration(
      labelText: AppLocalizations.of(context)!.whatsInYourMind,
      errorBorder: activeBorder(TaskiColors.redShade),
      prefixIcon: _titlePrefixIcon(),
      labelStyle: _titleLableStyle(),
      errorStyle: _titleErrorStyle(),
      focusedErrorBorder: noBorder(),
      disabledBorder: noBorder(),
      enabledBorder: noBorder(),
      focusedBorder: noBorder(),
      border: noBorder(),
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

  TextStyle _titleTextStyle(bool isDarkMode) {
    return GoogleFonts.urbanist(
      color: isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple,
      fontWeight: FontWeight.normal,
      fontSize: 18,
    );
  }

  TextStyle _titleLableStyle() {
    return GoogleFonts.urbanist(
      color: TaskiColors.mutedAzure,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    );
  }

  TextStyle _titleErrorStyle() {
    return GoogleFonts.urbanist(
      color: TaskiColors.fireRed,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    );
  }

  Widget _description(bool isDarkMode) {
    return Container(
      margin: EdgeInsets.only(top: _descriptionFocus.hasFocus ? 32 : 0),
      child: TextField(
        key: Key(WidgetsKeys.createTaskDescriptionInput),
        decoration: _descriptionInputDecoration(),
        style: _descriptionTextstyle(isDarkMode),
        textInputAction: TextInputAction.done,
        controller: _descriptionController,
        focusNode: _descriptionFocus,
        maxLines: 2,
      ),
    );
  }

  InputDecoration _descriptionInputDecoration() {
    return InputDecoration(
      prefixIcon: Icon(Icons.edit, color: TaskiColors.mutedAzure),
      labelText: AppLocalizations.of(context)!.addNote,
      labelStyle: _descriptionLabelStyle(),
      focusedErrorBorder: noBorder(),
      disabledBorder: noBorder(),
      enabledBorder: noBorder(),
      focusedBorder: noBorder(),
      errorBorder: noBorder(),
      border: noBorder(),
    );
  }

  TextStyle _descriptionTextstyle(bool isDarkMode) {
    return GoogleFonts.urbanist(
      color: isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple,
      fontWeight: FontWeight.normal,
      fontSize: 18,
    );
  }

  TextStyle _descriptionLabelStyle() {
    return GoogleFonts.urbanist(
      color: TaskiColors.mutedAzure,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    );
  }

  Widget _createButton() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      alignment: Alignment.centerRight,
      child: TextButton(
        key: Key(WidgetsKeys.createTaskSubmitButton),
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
