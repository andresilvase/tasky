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
      margin: const EdgeInsets.only(left: 40, top: 32, right: 40),
      child: Column(
        children: [
          _title(),
          SizedBox(
            height: _descriptionFocus.hasFocus ? 32 : 0,
          ),
          _description(),
          _createButton(),
        ],
      ),
    );
  }

  Widget _title() {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _titleController,
        style: GoogleFonts.urbanist(
          color: TaskyColors.statePurple,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Title is required';
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Transform.scale(
            scale: 1.25,
            child: Checkbox(
              visualDensity: VisualDensity(vertical: -4),
              checkColor: TaskyColors.white,
              onChanged: null,
              value: false,
              side: BorderSide(
                color: TaskyColors.mutedAzure,
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          labelStyle: GoogleFonts.urbanist(
            color: TaskyColors.mutedAzure,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          labelText: 'What\'s in your mind?',
          focusedErrorBorder: _noBorder(),
          disabledBorder: _noBorder(),
          enabledBorder: _noBorder(),
          focusedBorder: _noBorder(),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: TaskyColors.redShade,
              width: 2,
            ),
          ),
          border: _noBorder(),
        ),
      ),
    );
  }

  Widget _description() {
    return TextFormField(
      controller: _descriptionController,
      focusNode: _descriptionFocus,
      style: GoogleFonts.urbanist(
        color: TaskyColors.statePurple,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
      maxLines: 2,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.edit, color: TaskyColors.mutedAzure),
        labelStyle: GoogleFonts.urbanist(
          color: TaskyColors.mutedAzure,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        labelText: 'Add a note',
        focusedErrorBorder: _noBorder(),
        disabledBorder: _noBorder(),
        enabledBorder: _noBorder(),
        focusedBorder: _noBorder(),
        errorBorder: _noBorder(),
        border: _noBorder(),
      ),
    );
  }

  OutlineInputBorder _noBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.none),
      borderRadius: BorderRadius.zero,
    );
  }

  Widget _createButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: createTask,
        child: Text(
          'Create',
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.bold,
            color: TaskyColors.blue,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
