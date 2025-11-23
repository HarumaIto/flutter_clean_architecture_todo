import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<TaskUiModel> tasks,
  }) = _HomeState;
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
