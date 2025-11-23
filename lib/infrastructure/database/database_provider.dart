import 'package:clean_architecture_todo/infrastructure/database/app_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}

@riverpod
TaskDao taskDao(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.taskDao;
}
