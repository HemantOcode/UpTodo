import '../models/task_model.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
  Future<Task> addTask(Task task);
  Future<int> updateTask(Task task);
  Future<int> deleteTask(int id);
}
