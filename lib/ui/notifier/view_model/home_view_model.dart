import 'package:clean_architecture_todo/domain/entity/task.dart';
import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:clean_architecture_todo/ui/state/home_state.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  // in-memory state
  final _tasks = <Task>[];

  @override
  HomeState build() {
    // 初期データ
    _tasks.addAll([
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
    ]);
    return _toHomeState();
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
    _tasks.add(newTask);
    state = _toHomeState();
  }

  void updateTask(Task updatedTask) {
    final index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
    }
    state = _toHomeState();
  }

  void removeTask(String taskId) {
    _tasks.removeWhere((task) => task.id == taskId);
    state = _toHomeState();
  }

  void toggleCompletion(String taskId) {
    final index = _tasks.indexWhere((task) => task.id == taskId);
    if (index != -1) {
      final task = _tasks[index];
      _tasks[index] = task.copyWith(isCompleted: !task.isCompleted);
    }
    state = _toHomeState();
  }

  HomeState _toHomeState() {
    final taskUiModels = _tasks.map((task) {
      return TaskUiModel(
        id: task.id,
        title: task.title,
        description: task.description,
        isCompleted: task.isCompleted,
        dueDate: DateFormat('yyyy/MM/dd').format(task.dueDate),
        priority: task.priority.name,
      );
    }).toList();

    return HomeState(tasks: taskUiModels);
  }
}
