import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gen_i18n_example/models/preferences.dart';
import 'package:gen_i18n_example/repositories/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'temp_preferences_impl.g.dart';

/// NOTE: This implements things that perhaps should be in a service,
/// but it's a good example of how to use riverpod and get_it together

@riverpod
class TempPreferencesRepositoryImpl extends _$TempPreferencesRepositoryImpl
    implements PreferencesRepository {
  Preferences _preferences = const Preferences(
    themeMode: ThemeMode.system,
    locale: Locale('en'),
  );

  @override
  Future<Preferences> build() async {
    return _preferences;
  }

  //This fials! because Get it and riverpod are not meant to work together
  ///Exception has occurred.
  /// LateError (LateInitializationError: Field '_element@41502701' has not been initialized.)
  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    _preferences = _preferences.copyWith(themeMode: themeMode);
    state = state.whenData((currentPref) => _preferences);
  }

  @override
  Future<void> setLocale(Locale locale) async {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;

    _preferences = _preferences.copyWith(locale: locale);
    state = state.whenData((currentPref) => _preferences);
  }
}
