import 'package:clean_architecture_todo/domain/value/priority.dart';

abstract class IAddTaskUseCase {
  Future<void> execute({
    required String title,
    required String description,
    required DateTime dueDate,
    required Priority priority,
  });
}
