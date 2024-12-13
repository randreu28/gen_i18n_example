import 'package:flutter/foundation.dart';
import 'package:gen_i18n_example/repositories/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gen_i18n_example/repositories/preferences_impl.dart';
import 'package:gen_i18n_example/repositories/temp_preferences_impl.dart';
import 'package:gen_i18n_example/models/preferences.dart';

part 'injection.g.dart';

@riverpod
PreferencesRepository preferencesRepository(PreferencesRepositoryRef ref) {
  // Return the repository notifier that we can call methods on.
  if (kDebugMode) {
    return ref.watch(tempPreferencesRepositoryImplProvider.notifier);
  } else {
    return ref.watch(preferencesRepositoryImplProvider.notifier);
  }
}

@riverpod
AsyncValue<Preferences> preferencesState(PreferencesStateRef ref) {
  // Return the current state (AsyncValue<Preferences>) of the chosen repository.
  if (kDebugMode) {
    return ref.watch(tempPreferencesRepositoryImplProvider);
  } else {
    return ref.watch(preferencesRepositoryImplProvider);
  }
}
