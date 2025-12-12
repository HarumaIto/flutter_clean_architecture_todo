import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_task_state.freezed.dart';

@freezed
abstract class AddTaskState with _$AddTaskState {
  const factory AddTaskState({
    required DateTime dueDate,
    @Default(Priority.none) Priority priority,
  }) = _AddTaskState;
}
