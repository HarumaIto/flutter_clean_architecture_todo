import 'package:clean_architecture_todo/domain/entity/task.dart';

class TaskOverdueService {
  bool isOverdue(Task task) {
    if (task.isCompleted) {
      return false;
    }
    final now = DateTime.now();
    return task.dueDate.isBefore(now);
  }
}
