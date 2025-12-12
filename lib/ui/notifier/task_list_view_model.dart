import 'package:clean_architecture_todo/application/provider/task_usecase_providers.dart';
import 'package:clean_architecture_todo/domain/service/vibration_service.dart';
import 'package:clean_architecture_todo/domain/usecase/remove_task_usecase.dart';
import 'package:clean_architecture_todo/domain/usecase/toggle_task_completion_usecase.dart';
import 'package:clean_architecture_todo/infrastructure/provider/vibration_service_provider.dart';
import 'package:clean_architecture_todo/ui/state/task_list_state.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_list_view_model.g.dart';

@riverpod
class TaskListViewModel extends _$TaskListViewModel {
  late final IRemoveTaskUseCase _removeTaskUseCase;
  late final IToggleTaskCompletionUseCase _toggleTaskCompletionUseCase;
  late final IVibrationService _vibrationService;
  late final DateFormat _dateFormat;

  @override
  TaskListState build() {
    _loadUseCases();
    _watchTasks();
    return const TaskListState();
  }

  void _loadUseCases() {
    _removeTaskUseCase = ref.read(removeTaskUseCaseProvider);
    _toggleTaskCompletionUseCase = ref.read(
      toggleTaskCompletionUseCaseProvider,
    );
    _vibrationService = ref.read(vibrationServiceProvider);
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
    _vibrationService.vibrate();
  }
}
