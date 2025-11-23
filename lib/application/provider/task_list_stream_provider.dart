import 'package:clean_architecture_todo/application/provider/task_usecase_providers.dart';
import 'package:clean_architecture_todo/domain/entity/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_list_stream_provider.g.dart';

@riverpod
Stream<List<Task>> taskListStream(Ref ref) {
  final watchTasksUseCase = ref.watch(watchTasksUseCaseProvider);
  return watchTasksUseCase.execute();
}
