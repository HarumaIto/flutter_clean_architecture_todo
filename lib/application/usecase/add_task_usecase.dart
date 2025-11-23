import 'package:clean_architecture_todo/domain/entity/task.dart';
import 'package:clean_architecture_todo/domain/repository/task_repository.dart';
import 'package:clean_architecture_todo/domain/usecase/add_task_usecase.dart';
import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:uuid/uuid.dart';

class AddTaskUseCase implements IAddTaskUseCase {
  final ITaskRepository _repository;

  AddTaskUseCase(this._repository);

  @override
  Future<void> execute({
    required String title,
    required String description,
    required DateTime dueDate,
    required Priority priority,
  }) {
    final newTask = Task(
      id: const Uuid().v4(),
      title: title,
      description: description,
      isCompleted: false,
      createdAt: DateTime.now(),
      dueDate: dueDate,
      priority: priority,
    );
    return _repository.addTask(newTask);
  }
}
