import 'package:flutter/material.dart';
import 'package:gen_i18n_example/models/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preferences.g.dart';

///TODO: Implement this
@riverpod
class PreferencesViewModel extends _$PreferencesViewModel {
  @override
  Future<Preferences> build() async {
    return const Preferences(
      themeMode: ThemeMode.system,
      locale: Locale("es"),
    );
  }

  Future<void> toggleThemeMode(bool isDarkMode) async {}

  Future<void> switchLocale(Locale locale) async {}
}
