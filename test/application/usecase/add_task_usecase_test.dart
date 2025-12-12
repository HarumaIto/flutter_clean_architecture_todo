import 'package:clean_architecture_todo/application/usecase/add_task_usecase.dart';
import 'package:clean_architecture_todo/domain/entity/task.dart';
import 'package:clean_architecture_todo/domain/repository/task_repository.dart';
import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_task_usecase_test.mocks.dart';

@GenerateMocks([ITaskRepository])
void main() {
  late AddTaskUseCase addTaskUseCase;
  late MockITaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockITaskRepository();
    addTaskUseCase = AddTaskUseCase(mockTaskRepository);
  });

  group('AddTaskUseCase', () {
    test('should call addTask on the repository with a new task', () async {
      // Arrange
      const title = 'Test Task';
      const description = 'Test Description';
      final dueDate = DateTime(2025, 1, 1);
      const priority = Priority.high;

      when(
        mockTaskRepository.addTask(any),
      ).thenAnswer((_) async => Future.value());

      // Act
      await addTaskUseCase.execute(
        title: title,
        description: description,
        dueDate: dueDate,
        priority: priority,
      );

      // Assert
      final verification = verify(mockTaskRepository.addTask(captureAny));
      verification.called(1);
      final capturedTask = verification.captured.single as Task;

      expect(capturedTask.title, title);
      expect(capturedTask.description, description);
      expect(capturedTask.dueDate, dueDate);
      expect(capturedTask.priority, priority);
      expect(capturedTask.isCompleted, isFalse);
    });
  });
}
