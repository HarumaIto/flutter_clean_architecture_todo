import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:clean_architecture_todo/domain/value/priority.dart';

part 'app_database.g.dart';

class PriorityConverter extends TypeConverter<Priority, int> {
  const PriorityConverter();
  @override
  Priority fromSql(int fromDb) {
    return Priority.values[fromDb];
  }

  @override
  int toSql(Priority value) {
    return value.index;
  }
}

class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  TextColumn get description => text()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get dueDate => dateTime()();
  IntColumn get priority => integer().map(const PriorityConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Tasks], daos: [TaskDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftAccessor(tables: [Tasks])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(super.db);

  Stream<List<Task>> watchAllTasks() => select(tasks).watch();
  Future<Task?> getTaskById(String id) => (select(tasks)..where((t) => t.id.equals(id))).getSingleOrNull();
  Future<void> insertTask(TasksCompanion task) => into(tasks).insert(task);
  Future<bool> updateTask(TasksCompanion task) => update(tasks).replace(task);
  Future<int> deleteTaskById(String id) => (delete(tasks)..where((t) => t.id.equals(id))).go();
}
