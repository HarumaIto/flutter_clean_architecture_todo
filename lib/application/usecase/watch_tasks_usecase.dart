import 'package:clean_architecture_todo/domain/entity/task.dart';
import 'package:clean_architecture_todo/domain/repository/task_repository.dart';
import 'package:clean_architecture_todo/domain/usecase/watch_tasks_usecase.dart';

class WatchTasksUseCase implements IWatchTasksUseCase {
  final ITaskRepository _repository;

  WatchTasksUseCase(this._repository);

  @override
  Stream<List<Task>> execute() {
    return _repository.watchTasks();
  }
}
