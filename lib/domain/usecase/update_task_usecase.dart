import 'package:clean_architecture_todo/domain/entity/task.dart';

abstract class IUpdateTaskUseCase {
  Future<void> execute(Task task);
}
