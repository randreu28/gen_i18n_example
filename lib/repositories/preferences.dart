import 'package:flutter/material.dart';
import 'package:gen_i18n_example/models/preferences.dart';

abstract class PreferencesRepository {
  Future<Preferences> build();
  Future<void> setThemeMode(ThemeMode mode);
  Future<void> setLocale(Locale locale);
}
