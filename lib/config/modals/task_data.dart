import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:mt_todo_app/config/constants/constants.dart';
import 'package:mt_todo_app/config/modals/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  getTasks() async {
    Box<Task> box = await Hive.openBox<Task>(kTaskDataHiveBox);
    _tasks = box.values.toList();
    notifyListeners();
  }

  addTask(Task task) async {
    Box<Task> box = await Hive.openBox<Task>(kTaskDataHiveBox);
    await box.add(task);
    _tasks.add(task);
    _tasks = box.values.toList();
    notifyListeners();
  }

  removeTask(Task task) async {
    var box = await Hive.openBox<Task>(kTaskDataHiveBox);
    await box.delete(task.key);
    _tasks = box.values.toList();
    notifyListeners();
  }

  updateTask(Task task, bool value) async {
    var box = await Hive.openBox<Task>(kTaskDataHiveBox);
    task.isDone = value;
    task.save();
    await box.put(task.key, task);
    _tasks = box.values.toList();
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }
}
