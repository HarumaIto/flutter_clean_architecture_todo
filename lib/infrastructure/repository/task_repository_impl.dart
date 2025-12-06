import 'package:clean_architecture_todo/domain/entity/task.dart' as domain_task;
import 'package:clean_architecture_todo/domain/repository/task_repository.dart';
import 'package:clean_architecture_todo/infrastructure/database/app_database.dart' as drift;
import 'package:clean_architecture_todo/infrastructure/database/task_dao.dart';
import 'package:drift/drift.dart';

class TaskRepositoryImpl implements ITaskRepository {
  TaskRepositoryImpl({required this.taskDao});
  final TaskDao taskDao;

  @override
  Stream<List<domain_task.Task>> watchTasks() {
    return taskDao.watchTasks().map(
          (driftTasks) => driftTasks
              .map(
                (driftTask) => _toDomainTask(driftTask),
              )
              .toList(),
        );
  }

  @override
  Future<domain_task.Task?> getTaskById(String taskId) async {
    final driftTask = await taskDao.getTaskById(taskId);
    return driftTask != null ? _toDomainTask(driftTask) : null;
  }

  @override
  Future<void> addTask(domain_task.Task task) {
    return taskDao.upsertTask(_fromDomainTask(task));
  }

  @override
  Future<void> updateTask(domain_task.Task task) {
    return taskDao.upsertTask(_fromDomainTask(task));
  }

  @override
  Future<void> removeTask(String taskId) {
    return taskDao.deleteTask(taskId);
  }

  domain_task.Task _toDomainTask(drift.Task driftTask) {
    return domain_task.Task(
      id: driftTask.id,
      title: driftTask.title,
      description: driftTask.description,
      isCompleted: driftTask.isCompleted,
      createdAt: driftTask.createdAt,
      dueDate: driftTask.dueDate,
      priority: driftTask.priority,
    );
  }

  drift.TasksCompanion _fromDomainTask(domain_task.Task domainTask) {
    return drift.TasksCompanion(
      id: Value(domainTask.id),
      title: Value(domainTask.title),
      description: Value(domainTask.description),
      isCompleted: Value(domainTask.isCompleted),
      createdAt: Value(domainTask.createdAt),
      dueDate: Value(domainTask.dueDate),
      priority: Value(domainTask.priority),
    );
  }
}
