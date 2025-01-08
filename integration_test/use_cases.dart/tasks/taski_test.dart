import 'package:flutter_test/flutter_test.dart';

import 'complete_task_test.dart';
import 'create_task_when_list_is_empty_test.dart';
import 'create_task_test.dart';
import 'delete_all_tasks_test.dart';
import 'delete_task_by_id.dart';
import 'search_task_by_description.dart';
import 'search_task_by_title.dart';

void taskTests() {
  group('tasks tests should', () {
    createTaskWhenListIsEmpty();
    createTask();
    completeTask();
    searchTaskByTitle();
    searchTaskByDescription();
    deleteTask();
    deleteAllTasksAtOnce();
  });
}
