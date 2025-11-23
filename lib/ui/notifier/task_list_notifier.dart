import 'package:clean_architecture_todo/domain/entity/task.dart';
import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'task_list_notifier.g.dart';

@riverpod
class TaskListNotifier extends _$TaskListNotifier {
  @override
  List<Task> build() {
    // 初期データ
    return [
      Task(
        id: const Uuid().v4(),
        title: '最初のタスク',
        description: 'これは最初のタスクです。',
        isCompleted: false,
        createdAt: DateTime.now(),
        dueDate: DateTime.now().add(const Duration(days: 1)),
        priority: Priority.medium,
      ),
      Task(
        id: const Uuid().v4(),
        title: '2番目のタスク',
        description: 'これは2番目のタスクです。',
        isCompleted: true,
        createdAt: DateTime.now(),
        dueDate: DateTime.now().add(const Duration(days: 2)),
        priority: Priority.high,
      ),
    ];
  }

  void addTask({
    required String title,
    required String description,
    required DateTime dueDate,
    required Priority priority,
  }) {
    final newTask = Task(
      id: const Uuid().v4(),
      title: title,
      description: description,
      isCompleted: false,
      createdAt: DateTime.now(),
      dueDate: dueDate,
      priority: priority,
    );
    state = [...state, newTask];
  }

  void updateTask(Task updatedTask) {
    state = [
      for (final task in state)
        if (task.id == updatedTask.id) updatedTask else task,
    ];
  }

  void removeTask(String taskId) {
    state = state.where((task) => task.id != taskId).toList();
  }

  void toggleCompletion(String taskId) {
    state = [
      for (final task in state)
        if (task.id == taskId)
          task.copyWith(isCompleted: !task.isCompleted)
        else
          task,
    ];
  }
}
