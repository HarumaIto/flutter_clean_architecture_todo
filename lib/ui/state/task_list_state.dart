import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_list_state.freezed.dart';

@freezed
abstract class TaskListState with _$TaskListState {
  const factory TaskListState({
    @Default([]) List<TaskUiModel> tasks,
  }) = _TaskListState;
}

@freezed
abstract class TaskUiModel with _$TaskUiModel {
  const factory TaskUiModel({
    required String id,
    required String title,
    required String description,
    required bool isCompleted,
    required String dueDate,
    required String priority,
  }) = _TaskUiModel;
}
