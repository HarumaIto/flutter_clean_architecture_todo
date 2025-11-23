import 'package:clean_architecture_todo/domain/repository/task_repository.dart';
import 'package:clean_architecture_todo/domain/usecase/toggle_task_completion_usecase.dart';

class ToggleTaskCompletionUseCase implements IToggleTaskCompletionUseCase {
  final ITaskRepository _repository;

  ToggleTaskCompletionUseCase(this._repository);

  @override
  Future<void> execute(String taskId) async {
    final task = await _repository.getTaskById(taskId);
    if (task != null) {
      final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
      await _repository.updateTask(updatedTask);
    }
  }
}
