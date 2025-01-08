import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/features/tasks/widgets/base_screen.dart';
import 'package:taski/features/auth/widgets/input_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/features/tasks/widgets/task_list.dart';
import 'package:taski/features/tasks/model/task.dart';
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
      _clearSearch();
    } else {
      makeSearchRequest(query);
    }
  }

  void _clearSearch() {
    setState(() {
      taskViewModel.addSearchQuery('');
    });
  }

  void makeSearchRequest(String query) {
    _debounce = Timer(Duration(milliseconds: 500), () {
      setState(() {
        if (query.length > 2) {
          taskViewModel.addSearchQuery(query);
        }
      });
    });
  }

  void _onInputClear() {
    setState(() {
      _onSearchChanged('');
      _searchController.clear();
    });
  }

  @override
  void initState() {
    _searchFocusNode.addListener(() => setState(() {}));
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
      onTap: _searchFocusNode.unfocus,
      child: BaseScreen(
        children: [
          _inputSearch(),
          _list(),
        ],
      ),
    );
  }

  Widget _inputSearch() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: InputText(
        isDarkMode: Theme.of(Get.context!).brightness == Brightness.dark,
        controller: _searchController,
        focusNode: _searchFocusNode,
        onInputClear: _onInputClear,
        onChanged: _onSearchChanged,
        prefixIcon: Icons.search,
        labelText: '',
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
