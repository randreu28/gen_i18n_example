import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gen_i18n_example/models/preferences.dart';
import 'package:gen_i18n_example/repositories/preferences.dart';

class TempPreferencesRepositoryImpl implements PreferencesRepository {
  Preferences _preferences = const Preferences(
    themeMode: ThemeMode.system,
    locale: Locale('en'),
  );
  @override
  Future<Preferences> build() async {
    return _preferences;
  }

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    _preferences = _preferences.copyWith(themeMode: themeMode);
  }

  @override
  Future<void> setLocale(Locale locale) async {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;
    _preferences = _preferences.copyWith(locale: locale);
  }
}
