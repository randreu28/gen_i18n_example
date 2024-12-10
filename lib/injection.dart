import 'package:flutter/foundation.dart';
import 'package:gen_i18n_example/repositories/preferences.dart';
import 'package:gen_i18n_example/services/preferences.dart';
import 'package:gen_i18n_example/services/temp_preferences.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupInjection() async {
  if (!kDebugMode) {
    getIt.registerSingleton<PreferencesRepository>(
      TempPreferencesService(),
    );
  } else {
    getIt.registerSingleton<PreferencesRepository>(
      PreferencesService(),
    );
  }
}
