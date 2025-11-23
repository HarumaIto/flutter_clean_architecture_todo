import 'package:clean_architecture_todo/application/provider/task_usecase_providers.dart';
import 'package:clean_architecture_todo/domain/usecase/add_task_usecase.dart';
import 'package:clean_architecture_todo/domain/usecase/remove_task_usecase.dart';
import 'package:clean_architecture_todo/domain/usecase/toggle_task_completion_usecase.dart';
import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:clean_architecture_todo/ui/state/home_state.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late final IAddTaskUseCase _addTaskUseCase;
  late final IRemoveTaskUseCase _removeTaskUseCase;
  late final IToggleTaskCompletionUseCase _toggleTaskCompletionUseCase;
  late final DateFormat _dateFormat;

  @override
  HomeState build() {
    _loadUseCases();
    _watchTasks();
    return const HomeState();
  }

  void _loadUseCases() {
    _addTaskUseCase = ref.read(addTaskUseCaseProvider);
    _removeTaskUseCase = ref.read(removeTaskUseCaseProvider);
    _toggleTaskCompletionUseCase = ref.read(
      toggleTaskCompletionUseCaseProvider,
    );
    _dateFormat = DateFormat('yyyy-MM-dd');
  }

  void _watchTasks() {
    final taskListStream = ref.watch(watchTasksUseCaseProvider);
    taskListStream.execute().map((tasks) {
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

  Future<void> removeTask(String taskId) async {
    await _removeTaskUseCase.execute(taskId);
  }

  Future<void> toggleCompletion(String taskId) async {
    await _toggleTaskCompletionUseCase.execute(taskId);
  }
}
