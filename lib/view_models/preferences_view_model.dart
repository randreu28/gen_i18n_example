import 'package:flutter/material.dart';
import 'package:gen_i18n_example/injection.dart';
import 'package:gen_i18n_example/models/preferences.dart';
import 'package:gen_i18n_example/repositories/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preferences_view_model.g.dart';

@riverpod
class PreferencesViewModel extends _$PreferencesViewModel {
  late final PreferencesRepository _repository;
  @override
  Future<Preferences> build() async {
    // Get the repository from GetIt
    _repository = getIt<PreferencesRepository>();
    // Load the initial preferences
    return _repository.build();
  }

  Future<void> toggleThemeMode(bool isDarkMode) async {
    final newMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    await _repository.setThemeMode(newMode);
    // Update state with the new preferences
    state = AsyncValue.data(
      state.value!.copyWith(themeMode: newMode),
    );
  }

  Future<void> switchLocale(Locale locale) async {
    await _repository.setLocale(locale);
    // Update state with the new locale
    state = AsyncValue.data(
      state.value!.copyWith(locale: locale),
    );
  }
}
