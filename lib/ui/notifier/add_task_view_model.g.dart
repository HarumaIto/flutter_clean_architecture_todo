// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddTaskViewModel)
const addTaskViewModelProvider = AddTaskViewModelProvider._();

final class AddTaskViewModelProvider
    extends $NotifierProvider<AddTaskViewModel, AddTaskState> {
  const AddTaskViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addTaskViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addTaskViewModelHash();

  @$internal
  @override
  AddTaskViewModel create() => AddTaskViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddTaskState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddTaskState>(value),
    );
  }
}

String _$addTaskViewModelHash() => r'479be3a7bfb94f260607ad7391aa861a59b6925f';

abstract class _$AddTaskViewModel extends $Notifier<AddTaskState> {
  AddTaskState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AddTaskState, AddTaskState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddTaskState, AddTaskState>,
              AddTaskState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
