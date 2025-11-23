// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TaskListNotifier)
const taskListProvider = TaskListNotifierProvider._();

final class TaskListNotifierProvider
    extends $NotifierProvider<TaskListNotifier, List<Task>> {
  const TaskListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskListNotifierHash();

  @$internal
  @override
  TaskListNotifier create() => TaskListNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Task> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Task>>(value),
    );
  }
}

String _$taskListNotifierHash() => r'8e15e02cf0b5bdfb58ea3409c2d3577d0416e77f';

abstract class _$TaskListNotifier extends $Notifier<List<Task>> {
  List<Task> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Task>, List<Task>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Task>, List<Task>>,
              List<Task>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
