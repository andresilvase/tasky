import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/core/widgets/text_field_common_widgets.dart';
import 'package:taski/features/tasks/widgets/base_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/features/tasks/widgets/task_list.dart';
import 'package:taski/features/tasks/model/task.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SearchTask extends StatefulWidget {
  const SearchTask({super.key});

  @override
  State<SearchTask> createState() => _SearchTaskState();
}

class _SearchTaskState extends State<SearchTask> {
  final TextEditingController _searchController = TextEditingController();
  final TaskViewModel taskViewModel = Get.find();
  final FocusNode _searchFocusNode = FocusNode();

  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    if (query.isEmpty) {
      setState(() {
        taskViewModel.addSearchQuery('');
      });
    } else {
      _debounce = Timer(Duration(milliseconds: 500), () {
        setState(() {
          if (query.length > 2) {
            taskViewModel.addSearchQuery(query);
          }
        });
      });
    }
  }

  @override
  void initState() {
    _searchFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _searchFocusNode.unfocus();
      },
      child: BaseScreen(
        children: [
          _inputSearch(),
          _list(),
        ],
      ),
    );
  }

  Color inputBorderColor() {
    if (_searchFocusNode.hasFocus) {
      return TaskiColors.blue;
    } else {
      return TaskiColors.mutedAzure;
    }
  }

  Widget _inputSearch() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: TextFormField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        onChanged: _onSearchChanged,
        style: GoogleFonts.urbanist(
          color: TaskiColors.statePurple,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(maxHeight: 42, maxWidth: 42),
          suffixIcon: suffixIcon(
            visible: _searchController.text.isNotEmpty,
            onPressed: () {
              setState(() {
                _onSearchChanged('');
                _searchController.clear();
              });
            },
          ),
          prefixIcon: Icon(
            color: inputBorderColor(),
            Icons.search,
          ),
          labelStyle: GoogleFonts.urbanist(
            fontWeight: FontWeight.normal,
            color: TaskiColors.mutedAzure,
            fontSize: 16,
          ),
          labelText: AppLocalizations.of(context)!.searchForATask,
          floatingLabelStyle: GoogleFonts.urbanist(
            fontWeight: FontWeight.normal,
            color: inputBorderColor(),
            fontSize: 16,
          ),
          enabledBorder: activeBorder(inputBorderColor()),
          focusedBorder: activeBorder(inputBorderColor()),
          focusedErrorBorder: noBorder(),
          disabledBorder: noBorder(),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: TaskiColors.redShade,
              width: 2,
            ),
          ),
          border: noBorder(),
        ),
      ),
    );
  }

  Widget _list() {
    return Obx(() {
      List<Task> tasks = taskViewModel.searchTasksResult;

      tasks.sort((a, b) => a.date.compareTo(b.date));

      return TaskList(
        emptyTasksMessage: AppLocalizations.of(Get.context!)!.noResultsFound,
        changeTaskStatus: (task) => taskViewModel.changeTaskStatus(task),
        deleteTask: (task) => taskViewModel.deleteTask(task),
        marginTop: Get.height * 0.1,
        tasks: tasks,
      );
    });
  }
}
