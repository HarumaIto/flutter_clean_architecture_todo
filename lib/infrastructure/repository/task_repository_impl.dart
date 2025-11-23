import 'package:clean_architecture_todo/domain/entity/task.dart' as domain_task;
import 'package:clean_architecture_todo/domain/repository/task_repository.dart';
import 'package:clean_architecture_todo/infrastructure/database/app_database.dart';
import 'package:drift/drift.dart';

class TaskRepositoryImpl implements ITaskRepository {
  final TaskDao _taskDao;

  TaskRepositoryImpl(this._taskDao);

  @override
  Future<void> addTask(domain_task.Task task) {
    return _taskDao.insertTask(_toCompanion(task));
  }

  @override
  Future<void> removeTask(String taskId) {
    return _taskDao.deleteTaskById(taskId);
  }

  @override
  Future<domain_task.Task?> getTaskById(String taskId) async {
    final task = await _taskDao.getTaskById(taskId);
    return task != null ? _toEntity(task) : null;
  }

  @override
  Future<void> updateTask(domain_task.Task task) async {
    await _taskDao.updateTask(_toCompanion(task));
  }

  @override
  Stream<List<domain_task.Task>> watchTasks() {
    return _taskDao.watchAllTasks().map((tasks) => tasks.map(_toEntity).toList());
  }

  domain_task.Task _toEntity(Task task) {
    return domain_task.Task(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: task.isCompleted,
      createdAt: task.createdAt,
      dueDate: task.dueDate,
      priority: task.priority,
    );
  }

  TasksCompanion _toCompanion(domain_task.Task task) {
    return TasksCompanion(
      id: Value(task.id),
      title: Value(task.title),
      description: Value(task.description),
      isCompleted: Value(task.isCompleted),
      createdAt: Value(task.createdAt),
      dueDate: Value(task.dueDate),
      priority: Value(task.priority),
    );
  }
}