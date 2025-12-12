import 'package:clean_architecture_todo/domain/repository/task_repository.dart';
import 'package:clean_architecture_todo/infrastructure/datasource/database_provider.dart';
import 'package:clean_architecture_todo/infrastructure/repository/task_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_repository_provider.g.dart';

@riverpod
ITaskRepository taskRepository(Ref ref) {
  final taskDao = ref.watch(taskDaoProvider);
  return TaskRepositoryImpl(taskDao: taskDao);
}
