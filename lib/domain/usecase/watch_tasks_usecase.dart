import 'package:clean_architecture_todo/domain/entity/task.dart';

abstract class IWatchTasksUseCase {
  Stream<List<Task>> execute();
}
