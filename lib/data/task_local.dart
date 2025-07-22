import 'package:uptodo/data/task_database.dart';
import 'package:uptodo/models/task_model.dart';

class TaskLocalSource {
  final db = TaskDatabase.instance;

  Future<List<Task>> fetchTasks() => db.readAllTasks();

  Future<Task> addTask(Task task) async {
    final id = await db.createTask(task);
    return task.copyWith(id: id);
  }

  Future<int> updateTask(Task task) => db.updateTask(task);

  Future<int> deleteTask(int id) => db.deleteTask(id);
}
