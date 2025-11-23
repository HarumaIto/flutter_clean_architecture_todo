import 'package:clean_architecture_todo/application/usecase/add_task_usecase.dart';
import 'package:clean_architecture_todo/application/usecase/remove_task_usecase.dart';
import 'package:clean_architecture_todo/application/usecase/toggle_task_completion_usecase.dart';
import 'package:clean_architecture_todo/application/usecase/update_task_usecase.dart';
import 'package:clean_architecture_todo/application/usecase/watch_tasks_usecase.dart';
import 'package:clean_architecture_todo/domain/usecase/add_task_usecase.dart';
import 'package:clean_architecture_todo/domain/usecase/remove_task_usecase.dart';
import 'package:clean_architecture_todo/domain/usecase/toggle_task_completion_usecase.dart';
import 'package:clean_architecture_todo/domain/usecase/update_task_usecase.dart';
import 'package:clean_architecture_todo/domain/usecase/watch_tasks_usecase.dart';
import 'package:clean_architecture_todo/infrastructure/provider/task_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_usecase_providers.g.dart';

@riverpod
IWatchTasksUseCase watchTasksUseCase(Ref ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return WatchTasksUseCase(repository);
}

@riverpod
IAddTaskUseCase addTaskUseCase(Ref ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return AddTaskUseCase(repository);
}

@riverpod
IUpdateTaskUseCase updateTaskUseCase(Ref ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return UpdateTaskUseCase(repository);
}

@riverpod
IRemoveTaskUseCase removeTaskUseCase(Ref ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return RemoveTaskUseCase(repository);
}

@riverpod
IToggleTaskCompletionUseCase toggleTaskCompletionUseCase(
    Ref ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return ToggleTaskCompletionUseCase(repository);
}
