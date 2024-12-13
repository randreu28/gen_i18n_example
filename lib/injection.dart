import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:gen_i18n_example/repositories/preferences.dart';
import 'package:gen_i18n_example/repositories/preferences_impl.dart';
import 'package:gen_i18n_example/repositories/temp_preferences_impl.dart';

final getIt = GetIt.instance;
Future<void> setupInjection() async {
  if (kDebugMode) {
    getIt.registerSingleton<PreferencesRepository>(
        TempPreferencesRepositoryImpl());
  } else {
    getIt.registerSingleton<PreferencesRepository>(PreferencesRepositoryImpl());
  }
}
