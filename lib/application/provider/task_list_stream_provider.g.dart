// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_stream_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(taskListStream)
const taskListStreamProvider = TaskListStreamProvider._();

final class TaskListStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Task>>,
          List<Task>,
          Stream<List<Task>>
        >
    with $FutureModifier<List<Task>>, $StreamProvider<List<Task>> {
  const TaskListStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskListStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskListStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<Task>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Task>> create(Ref ref) {
    return taskListStream(ref);
  }
}

String _$taskListStreamHash() => r'886463a4a4a8372b879141cf357c24c43057efcf';
