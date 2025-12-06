import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_task_state.freezed.dart';

@freezed
abstract class AddTaskState with _$AddTaskState {
  const factory AddTaskState() = _AddTaskState;
}
