import 'package:clean_architecture_todo/infrastructure/datasource/app_database.dart';
import 'package:drift/drift.dart';

@DataClassName('Task')
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
