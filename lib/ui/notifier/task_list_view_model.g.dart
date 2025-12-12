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

String _$taskListViewModelHash() => r'db124da9989c5c612bc467dc214dd9d4fc8eaac7';

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
