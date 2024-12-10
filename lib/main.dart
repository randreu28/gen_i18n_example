import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_i18n_example/injection.dart';
import 'package:gen_i18n_example/view_model/preferences.dart';
import 'package:gen_i18n_example/views/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(preferencesViewModelProvider);

    return MaterialApp(
      locale: preferences.value?.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MainApp(),
      themeMode: preferences.value?.themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      darkTheme: ThemeData.dark(),
    );
  }
}
