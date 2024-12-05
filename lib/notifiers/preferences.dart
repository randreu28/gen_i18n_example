import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gen_i18n_example/models/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences.g.dart';

@riverpod
class PreferencesNotifier extends _$PreferencesNotifier {
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

  Future<void> setThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeModeKey, themeMode.index);
    state = state
        .whenData((currentPref) => currentPref.copyWith(themeMode: themeMode));
  }

  Future<void> setLocale(Locale locale) async {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);

    state =
        state.whenData((currentPref) => currentPref.copyWith(locale: locale));
  }
}
