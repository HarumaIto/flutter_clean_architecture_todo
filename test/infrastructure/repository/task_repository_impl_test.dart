import 'dart:async';

import 'package:clean_architecture_todo/domain/entity/task.dart' as domain_task;
import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:clean_architecture_todo/infrastructure/database/app_database.dart'
    as drift;
import 'package:clean_architecture_todo/infrastructure/database/task_dao.dart';
import 'package:clean_architecture_todo/infrastructure/repository/task_repository_impl.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'task_repository_impl_test.mocks.dart';

@GenerateMocks([TaskDao])
void main() {
  late TaskRepositoryImpl taskRepository;
  late MockTaskDao mockTaskDao;

  setUp(() {
    mockTaskDao = MockTaskDao();
    taskRepository = TaskRepositoryImpl(taskDao: mockTaskDao);
  });

  group('TaskRepositoryImpl Tests', () {
    final testDriftTask = drift.Task(
      id: '1',
      title: 'Test Task',
      description: 'Test Description',
      isCompleted: false,
      createdAt: DateTime(2023, 1, 1),
      dueDate: DateTime(2023, 1, 2),
      priority: Priority.low,
    );

    final testDomainTask = domain_task.Task(
      id: '1',
      title: 'Test Task',
      description: 'Test Description',
      isCompleted: false,
      createdAt: DateTime(2023, 1, 1),
      dueDate: DateTime(2023, 1, 2),
      priority: Priority.low,
    );

    final testTasksCompanion = drift.TasksCompanion(
      id: const Value('1'),
      title: const Value('Test Task'),
      description: const Value('Test Description'),
      isCompleted: const Value(false),
      createdAt: Value(DateTime(2023, 1, 1)),
      dueDate: Value(DateTime(2023, 1, 2)),
      priority: const Value(Priority.low),
    );

    test('watchTasks should return a stream of domain tasks', () {
      // Arrange
      final streamController = StreamController<List<drift.Task>>();
      when(mockTaskDao.watchTasks()).thenAnswer((_) => streamController.stream);

      // Act
      final result = taskRepository.watchTasks();

      // Assert
      expect(
        result,
        emitsInOrder([
          [testDomainTask],
        ]),
      );

      // Add data to the stream
      streamController.add([testDriftTask]);
      streamController.close();
    });

    test('getTaskById should return a domain task when found', () async {
      // Arrange
      when(mockTaskDao.getTaskById('1')).thenAnswer((_) async => testDriftTask);

      // Act
      final result = await taskRepository.getTaskById('1');

      // Assert
      expect(result, testDomainTask);
      verify(mockTaskDao.getTaskById('1')).called(1);
    });

    test('getTaskById should return null when task is not found', () async {
      // Arrange
      when(mockTaskDao.getTaskById('1')).thenAnswer((_) async => null);

      // Act
      final result = await taskRepository.getTaskById('1');

      // Assert
      expect(result, null);
      verify(mockTaskDao.getTaskById('1')).called(1);
    });

    test('addTask should call upsertTask on the dao', () async {
      // Arrange
      when(mockTaskDao.upsertTask(any)).thenAnswer((_) async => Future.value());

      // Act
      await taskRepository.addTask(testDomainTask);

      // Assert
      final captured =
          verify(mockTaskDao.upsertTask(captureAny)).captured.single
              as drift.TasksCompanion;
      expect(captured.id.value, testTasksCompanion.id.value);
      expect(captured.title.value, testTasksCompanion.title.value);
    });

    test('updateTask should call upsertTask on the dao', () async {
      // Arrange
      when(mockTaskDao.upsertTask(any)).thenAnswer((_) async => Future.value());

      // Act
      await taskRepository.updateTask(testDomainTask);

      // Assert
      final captured =
          verify(mockTaskDao.upsertTask(captureAny)).captured.single
              as drift.TasksCompanion;
      expect(captured.id.value, testTasksCompanion.id.value);
      expect(captured.title.value, testTasksCompanion.title.value);
    });

    test('removeTask should call deleteTask on the dao', () async {
      // Arrange
      when(mockTaskDao.deleteTask('1')).thenAnswer((_) async => Future.value());

      // Act
      await taskRepository.removeTask('1');

      // Assert
      verify(mockTaskDao.deleteTask('1')).called(1);
    });
  });
}
