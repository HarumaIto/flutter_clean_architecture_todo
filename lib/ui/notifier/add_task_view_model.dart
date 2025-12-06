import 'package:clean_architecture_todo/application/provider/task_usecase_providers.dart';
import 'package:clean_architecture_todo/domain/usecase/add_task_usecase.dart';
import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:clean_architecture_todo/ui/state/add_task_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_task_view_model.g.dart';

@riverpod
class AddTaskViewModel extends _$AddTaskViewModel {
  late final IAddTaskUseCase _addTaskUseCase;

  @override
  AddTaskState build() {
    _loadUseCases();
    return const AddTaskState();
  }

  void _loadUseCases() {
    _addTaskUseCase = ref.read(addTaskUseCaseProvider);
  }

  Future<void> addTask({
    required String title,
    required String description,
    required DateTime dueDate,
    required Priority priority,
  }) async {
    await _addTaskUseCase.execute(
      title: title,
      description: description,
      dueDate: dueDate,
      priority: priority,
    );
  }
}
