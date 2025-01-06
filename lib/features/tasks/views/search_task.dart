import 'package:taski/features/tasks/widgets/text_field_no_border.dart';
import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/features/tasks/widgets/base_screen.dart';
import 'package:taski/features/tasks/widgets/task_list.dart';
import 'package:taski/features/tasks/model/task.dart';
import 'package:taski/core/widgets/icon_svg.dart';
import 'package:taski/core/constants/assets.dart';
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

  Widget _suffixIcon() {
    return Visibility(
      visible: _searchController.text.isNotEmpty,
      child: IconButton(
        onPressed: () {
          setState(() {
            _onSearchChanged('');
            _searchFocusNode.unfocus();
            _searchController.clear();
          });
        },
        icon: IconSvg(assetName: TaskiAssets.close, size: 34),
      ),
    );
  }

  OutlineInputBorder _activeBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: TaskiColors.blue,
        style: BorderStyle.solid,
        width: 2,
      ),
    );
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
          suffixIconConstraints: BoxConstraints(maxHeight: 34, maxWidth: 34),
          suffixIcon: _suffixIcon(),
          prefixIcon: Icon(Icons.search, color: TaskiColors.blue),
          labelStyle: GoogleFonts.urbanist(
            fontWeight: FontWeight.normal,
            color: TaskiColors.mutedAzure,
            fontSize: 16,
          ),
          labelText: 'Search for a task',
          focusedErrorBorder: noBorder(),
          focusedBorder: _activeBorder(),
          enabledBorder: _activeBorder(),
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
        changeTaskStatus: (task) => taskViewModel.changeTaskStatus(task),
        deleteTask: (task) => taskViewModel.deleteTask(task),
        emptyTasksMessage: 'No results found',
        tasks: tasks,
      );
    });
  }
}
