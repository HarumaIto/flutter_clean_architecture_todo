import 'package:clean_architecture_todo/domain/entity/task.dart';

abstract class ITaskRepository {
  Stream<List<Task>> watchTasks();
  Future<Task?> getTaskById(String taskId);
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> removeTask(String taskId);
}
