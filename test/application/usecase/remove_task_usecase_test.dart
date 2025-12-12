import 'package:clean_architecture_todo/application/usecase/remove_task_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'add_task_usecase_test.mocks.dart';

void main() {
  late RemoveTaskUseCase removeTaskUseCase;
  late MockITaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockITaskRepository();
    removeTaskUseCase = RemoveTaskUseCase(mockTaskRepository);
  });

  group('RemoveTaskUseCase', () {
    test(
      'should call removeTask on the repository with the given id',
      () async {
        // Arrange
        const taskId = 'test-id';
        when(
          mockTaskRepository.removeTask(any),
        ).thenAnswer((_) async => Future.value());

        // Act
        await removeTaskUseCase.execute(taskId);

        // Assert
        verify(mockTaskRepository.removeTask(taskId)).called(1);
      },
    );
  });
}
