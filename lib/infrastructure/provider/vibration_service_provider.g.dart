// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vibration_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(vibrationService)
const vibrationServiceProvider = VibrationServiceProvider._();

final class VibrationServiceProvider
    extends
        $FunctionalProvider<
          IVibrationService,
          IVibrationService,
          IVibrationService
        >
    with $Provider<IVibrationService> {
  const VibrationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vibrationServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vibrationServiceHash();

  @$internal
  @override
  $ProviderElement<IVibrationService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IVibrationService create(Ref ref) {
    return vibrationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IVibrationService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IVibrationService>(value),
    );
  }
}

String _$vibrationServiceHash() => r'bfbfcdd03a7377b8b7e18bfed331f289e1c88ddc';
