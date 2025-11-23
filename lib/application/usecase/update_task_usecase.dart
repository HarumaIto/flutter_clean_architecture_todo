import 'package:clean_architecture_todo/domain/entity/task.dart';
import 'package:clean_architecture_todo/domain/repository/task_repository.dart';
import 'package:clean_architecture_todo/domain/usecase/update_task_usecase.dart';

class UpdateTaskUseCase implements IUpdateTaskUseCase {
  final ITaskRepository _repository;

  UpdateTaskUseCase(this._repository);

  @override
  Future<void> execute(Task task) {
    return _repository.updateTask(task);
  }
}
