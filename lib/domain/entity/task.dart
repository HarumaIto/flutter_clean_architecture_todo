import 'package:clean_architecture_todo/core/converter/timestamp_converter.dart';
import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    required String description,
    required bool isCompleted,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime dueDate,
    required Priority priority,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
