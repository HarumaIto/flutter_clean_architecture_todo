import 'dart:io';

import 'package:clean_architecture_todo/infrastructure/database/task_dao.dart';
import 'package:clean_architecture_todo/infrastructure/database/task_table.dart';
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

@DriftDatabase(tables: [Tasks], daos: [TaskDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  TaskDao get taskDao => TaskDao(this);

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
