import 'package:clean_architecture_todo/domain/repository/task_repository.dart';
import 'package:clean_architecture_todo/domain/usecase/remove_task_usecase.dart';

class RemoveTaskUseCase implements IRemoveTaskUseCase {
  final ITaskRepository _repository;

  RemoveTaskUseCase(this._repository);

  @override
  Future<void> execute(String taskId) {
    return _repository.removeTask(taskId);
  }
}
