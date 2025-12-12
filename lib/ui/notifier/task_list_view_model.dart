import 'package:clean_architecture_todo/application/provider/task_usecase_providers.dart';
import 'package:clean_architecture_todo/domain/service/task_overdue_service.dart';
import 'package:clean_architecture_todo/domain/usecase/remove_task_usecase.dart';
import 'package:clean_architecture_todo/domain/usecase/toggle_task_completion_usecase.dart';
import 'package:clean_architecture_todo/ui/state/task_list_state.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_list_view_model.g.dart';

@riverpod
class TaskListViewModel extends _$TaskListViewModel {
  late IRemoveTaskUseCase _removeTaskUseCase;
  late IToggleTaskCompletionUseCase _toggleTaskCompletionUseCase;
  late TaskOverdueService _taskOverdueService;
  late DateFormat _dateFormat;

  @override
  TaskListState build() {
    _loadUseCases();
    _watchTasks();
    return const TaskListState();
  }

  void _loadUseCases() {
    _removeTaskUseCase = ref.watch(removeTaskUseCaseProvider);
    _toggleTaskCompletionUseCase = ref.watch(
      toggleTaskCompletionUseCaseProvider,
    );
    _taskOverdueService = TaskOverdueService();
    _dateFormat = DateFormat('yyyy-MM-dd');
  }

  void _watchTasks() {
    final watchTasksUseCase = ref.watch(watchTasksUseCaseProvider);
    watchTasksUseCase.execute().listen((tasks) {
      final taskUiModels = tasks
          .map(
            (task) => TaskUiModel(
              id: task.id,
              title: task.title,
              description: task.description,
              isCompleted: task.isCompleted,
              dueDate: _dateFormat.format(task.dueDate),
              priority: task.priority.name,
              isOverdue: _taskOverdueService.isOverdue(task),
            ),
          )
          .toList();
      state = state.copyWith(tasks: taskUiModels);
    });
  }

  Future<void> removeTask(String taskId) async {
    await _removeTaskUseCase.execute(taskId);
  }

  Future<void> toggleCompletion(String taskId) async {
    await _toggleTaskCompletionUseCase.execute(taskId);
  }
}
