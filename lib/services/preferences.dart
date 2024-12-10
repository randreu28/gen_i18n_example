import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gen_i18n_example/models/preferences.dart';
import 'package:gen_i18n_example/repositories/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences.g.dart';

@riverpod
class PreferencesService extends _$PreferencesService
    implements PreferencesRepository {
  static const _themeModeKey = 'theme_mode';
  static const _localeKey = 'locale';

  @override
  Future<Preferences> build() async {
    final prefs = await SharedPreferences.getInstance();

    final themeModeIndex =
        prefs.getInt(_themeModeKey) ?? ThemeMode.system.index;
    final themeMode = ThemeMode.values[themeModeIndex];

    final languageCode = prefs.getString(_localeKey) ?? 'en';

    return Preferences(
      themeMode: themeMode,
      locale: Locale(languageCode),
    );
  }

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeModeKey, themeMode.index);

    //This fials! because Get it and riverpod are not meant to work together
    ///Exception has occurred.
    /// LateError (LateInitializationError: Field '_element@41502701' has not been initialized.)
    state = state
        .whenData((currentPref) => currentPref.copyWith(themeMode: themeMode));
  }

  @override
  Future<void> setLocale(Locale locale) async {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);

    state =
        state.whenData((currentPref) => currentPref.copyWith(locale: locale));
  }
}
