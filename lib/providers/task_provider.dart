import 'package:flutter/material.dart';
import 'package:uptodo/data/task_local.dart';
import 'package:uptodo/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final TaskLocalSource _localSource = TaskLocalSource();
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskProvider() {
    loadTasks();
  }

  Future<void> loadTasks() async {
    _tasks = await _localSource.fetchTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await _localSource.addTask(task);
    await loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await _localSource.deleteTask(id);
    await loadTasks();
  }

  Future<void> toggleTask(Task task) async {
    final updated = task.copyWith(isCompleted: !task.isCompleted);
    await _localSource.updateTask(updated);
    await loadTasks();
  }
}
