import 'package:flutter/material.dart';

import '../model/task.dart';

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  TasksProvider() {
    _tasks.addAll(Task.mockUpTasks); // Loading dummy data
  }

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void pinTask(Task task) {
    // Unpin any other pinned task
    for (var task in _tasks) {
      if (task.isPinned) {
        task.isPinned = false;
      }
    }

    task.isPinned = true;
    notifyListeners();
  }
}
