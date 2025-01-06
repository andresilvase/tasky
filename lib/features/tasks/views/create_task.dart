import 'package:taski/features/tasks/widgets/text_field_no_border.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    _descriptionFocus.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void createTask() {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      final Task task = Task(
        description: _descriptionController.text,
        title: _titleController.text,
        date: DateTime.now(),
        isCompleted: false,
        id: '',
      );

      final TaskViewModel taskViewModel = Get.find();
      taskViewModel.addTask(task);

      _titleController.clear();
      _descriptionController.clear();

      _descriptionFocus.unfocus();
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 40,
        left: 40,
        top: 16,
      ),
      child: Column(
        children: [
          _title(),
          SizedBox(height: _descriptionFocus.hasFocus ? 32 : 0),
          _description(),
          _createButton(),
        ],
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: _titleController,
          style: GoogleFonts.urbanist(
            color: TaskiColors.statePurple,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Title is required';
            }
            return null;
          },
          cursorErrorColor: TaskiColors.redShade,
          decoration: InputDecoration(
            prefixIcon: Transform.scale(
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
            ),
            labelStyle: GoogleFonts.urbanist(
              color: TaskiColors.mutedAzure,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
            labelText: AppLocalizations.of(context)!.whatsInYourMind,
            errorStyle: GoogleFonts.urbanist(
              color: TaskiColors.fireRed,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            focusedErrorBorder: noBorder(),
            disabledBorder: noBorder(),
            enabledBorder: noBorder(),
            focusedBorder: noBorder(),
            errorBorder: activeBorder(TaskiColors.redShade),
            border: noBorder(),
          ),
        ),
      ),
    );
  }

  Widget _description() {
    return TextField(
      controller: _descriptionController,
      focusNode: _descriptionFocus,
      style: GoogleFonts.urbanist(
        color: TaskiColors.statePurple,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
      maxLines: 2,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.edit, color: TaskiColors.mutedAzure),
        labelStyle: GoogleFonts.urbanist(
          color: TaskiColors.mutedAzure,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        labelText: AppLocalizations.of(context)!.addNote,
        focusedErrorBorder: noBorder(),
        disabledBorder: noBorder(),
        enabledBorder: noBorder(),
        focusedBorder: noBorder(),
        errorBorder: noBorder(),
        border: noBorder(),
      ),
    );
  }

  Widget _createButton() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: createTask,
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
