import 'package:clean_architecture_todo/application/usecase/toggle_task_completion_usecase.dart';
import 'package:clean_architecture_todo/domain/entity/task.dart';
import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'add_task_usecase_test.mocks.dart';

void main() {
  late ToggleTaskCompletionUseCase toggleTaskCompletionUseCase;
  late MockITaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockITaskRepository();
    toggleTaskCompletionUseCase = ToggleTaskCompletionUseCase(
      mockTaskRepository,
    );
  });

  group('ToggleTaskCompletionUseCase', () {
    final testTask = Task(
      id: '1',
      title: 'Test Task',
      description: 'Test Description',
      isCompleted: false,
      createdAt: DateTime(2023, 1, 1),
      dueDate: DateTime(2023, 1, 2),
      priority: Priority.low,
    );

    test('should get task, toggle completion, and update repository', () async {
      // Arrange
      when(
        mockTaskRepository.getTaskById('1'),
      ).thenAnswer((_) async => testTask);
      when(
        mockTaskRepository.updateTask(any),
      ).thenAnswer((_) async => Future.value());

      // Act
      await toggleTaskCompletionUseCase.execute('1');

      // Assert
      verify(mockTaskRepository.getTaskById('1')).called(1);

      final captured =
          verify(mockTaskRepository.updateTask(captureAny)).captured.single
              as Task;
      expect(captured.id, testTask.id);
      expect(captured.isCompleted, !testTask.isCompleted);
    });

    test('should do nothing if task is not found', () async {
      // Arrange
      when(mockTaskRepository.getTaskById('1')).thenAnswer((_) async => null);

      // Act
      await toggleTaskCompletionUseCase.execute('1');

      // Assert
      verify(mockTaskRepository.getTaskById('1')).called(1);
      verifyNever(mockTaskRepository.updateTask(any));
    });
  });
}
