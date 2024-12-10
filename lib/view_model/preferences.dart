import 'package:flutter/material.dart';
import 'package:gen_i18n_example/injection.dart';
import 'package:gen_i18n_example/models/preferences.dart';
import 'package:gen_i18n_example/repositories/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preferences.g.dart';

@riverpod
class PreferencesViewModel extends _$PreferencesViewModel {
  final _preferencesServiceProvider = getIt<PreferencesRepository>();

  @override
  Future<Preferences> build() async {
    return _preferencesServiceProvider.build();
  }

  Future<void> toggleThemeMode(bool isDarkMode) async {
    return _preferencesServiceProvider.setThemeMode(
      isDarkMode ? ThemeMode.light : ThemeMode.dark,
    );
  }

  Future<void> switchLocale(Locale locale) async {
    return _preferencesServiceProvider.setLocale(locale);
  }
}
