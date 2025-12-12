import 'package:clean_architecture_todo/application/usecase/update_task_usecase.dart';
import 'package:clean_architecture_todo/domain/entity/task.dart';
import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'add_task_usecase_test.mocks.dart';

void main() {
  late UpdateTaskUseCase updateTaskUseCase;
  late MockITaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockITaskRepository();
    updateTaskUseCase = UpdateTaskUseCase(mockTaskRepository);
  });

  group('UpdateTaskUseCase', () {
    final testTask = Task(
      id: '1',
      title: 'Test Task',
      description: 'Test Description',
      isCompleted: false,
      createdAt: DateTime(2023, 1, 1),
      dueDate: DateTime(2023, 1, 2),
      priority: Priority.low,
    );

    test(
      'should call updateTask on the repository with the given task',
      () async {
        // Arrange
        when(
          mockTaskRepository.updateTask(any),
        ).thenAnswer((_) async => Future.value());

        // Act
        await updateTaskUseCase.execute(testTask);

        // Assert
        final captured =
            verify(mockTaskRepository.updateTask(captureAny)).captured.single
                as Task;
        expect(captured, testTask);
      },
    );
  });
}
