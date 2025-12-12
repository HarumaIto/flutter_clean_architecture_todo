import 'dart:async';

import 'package:clean_architecture_todo/application/usecase/watch_tasks_usecase.dart';
import 'package:clean_architecture_todo/domain/entity/task.dart';
import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'add_task_usecase_test.mocks.dart';

void main() {
  late WatchTasksUseCase watchTasksUseCase;
  late MockITaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockITaskRepository();
    watchTasksUseCase = WatchTasksUseCase(mockTaskRepository);
  });

  group('WatchTasksUseCase', () {
    final testTask = Task(
      id: '1',
      title: 'Test Task',
      description: 'Test Description',
      isCompleted: false,
      createdAt: DateTime(2023, 1, 1),
      dueDate: DateTime(2023, 1, 2),
      priority: Priority.low,
    );

    test('should return a stream of tasks from the repository', () {
      // Arrange
      final streamController = StreamController<List<Task>>();
      when(
        mockTaskRepository.watchTasks(),
      ).thenAnswer((_) => streamController.stream);

      // Act
      final result = watchTasksUseCase.execute();

      // Assert
      expect(
        result,
        emitsInOrder([
          [testTask],
        ]),
      );

      // Add data to the stream
      streamController.add([testTask]);
      streamController.close();
    });
  });
}
