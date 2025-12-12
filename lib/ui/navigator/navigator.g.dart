// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(navigator)
const navigatorProvider = NavigatorProvider._();

final class NavigatorProvider
    extends $FunctionalProvider<Navigator, Navigator, Navigator>
    with $Provider<Navigator> {
  const NavigatorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigatorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigatorHash();

  @$internal
  @override
  $ProviderElement<Navigator> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Navigator create(Ref ref) {
    return navigator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Navigator value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Navigator>(value),
    );
  }
}

String _$navigatorHash() => r'6ebd77001d450b9d35062a86c544133091d4906c';
