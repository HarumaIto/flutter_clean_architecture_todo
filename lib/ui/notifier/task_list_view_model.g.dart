// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TaskListViewModel)
const taskListViewModelProvider = TaskListViewModelProvider._();

final class TaskListViewModelProvider
    extends $NotifierProvider<TaskListViewModel, TaskListState> {
  const TaskListViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskListViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskListViewModelHash();

  @$internal
  @override
  TaskListViewModel create() => TaskListViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TaskListState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TaskListState>(value),
    );
  }
}

String _$taskListViewModelHash() => r'642a4315ea59f8e8bb9b281c38e07109d8b8b5c0';

abstract class _$TaskListViewModel extends $Notifier<TaskListState> {
  TaskListState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TaskListState, TaskListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TaskListState, TaskListState>,
              TaskListState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
