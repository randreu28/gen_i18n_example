// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$preferencesRepositoryHash() =>
    r'd0f624f789ef1b4b205a1a1fcaad0deced139602';

/// See also [preferencesRepository].
@ProviderFor(preferencesRepository)
final preferencesRepositoryProvider =
    AutoDisposeProvider<PreferencesRepository>.internal(
  preferencesRepository,
  name: r'preferencesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$preferencesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PreferencesRepositoryRef
    = AutoDisposeProviderRef<PreferencesRepository>;
String _$preferencesStateHash() => r'3c50ddd07f51eca9d0c0a72969628de06a42758a';

/// See also [preferencesState].
@ProviderFor(preferencesState)
final preferencesStateProvider =
    AutoDisposeProvider<AsyncValue<Preferences>>.internal(
  preferencesState,
  name: r'preferencesStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$preferencesStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PreferencesStateRef = AutoDisposeProviderRef<AsyncValue<Preferences>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
