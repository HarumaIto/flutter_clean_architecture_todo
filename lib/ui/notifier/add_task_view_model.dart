import 'package:clean_architecture_todo/application/provider/task_usecase_providers.dart';
import 'package:clean_architecture_todo/domain/usecase/add_task_usecase.dart';
import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:clean_architecture_todo/ui/state/add_task_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_task_view_model.g.dart';

@riverpod
class AddTaskViewModel extends _$AddTaskViewModel {
  late IAddTaskUseCase _addTaskUseCase;

  @override
  AddTaskState build() {
    _loadUseCases();
    return AddTaskState(dueDate: DateTime.now());
  }

  void _loadUseCases() {
    _addTaskUseCase = ref.watch(addTaskUseCaseProvider);
  }

  void setDueDate(DateTime dueDate) {
    state = state.copyWith(dueDate: dueDate);
  }

  void setPriority(Priority priority) {
    state = state.copyWith(priority: priority);
  }

  Future<void> addTask({
    required String title,
    required String description,
  }) async {
    await _addTaskUseCase.execute(
      title: title,
      description: description,
      dueDate: state.dueDate,
      priority: state.priority,
    );
  }
}
