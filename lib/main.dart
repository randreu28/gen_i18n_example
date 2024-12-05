import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_i18n_example/notifiers/preferences.dart';

void main() async {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(preferencesNotifierProvider);

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

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(preferencesNotifierProvider);
    final isDarkMode = preferences.value?.themeMode == ThemeMode.dark;

    void toggleThemeMode(bool isDarkMode) {
      final preferencesNotifier = ref.read(
        preferencesNotifierProvider.notifier,
      );

      preferencesNotifier.setThemeMode(
        isDarkMode ? ThemeMode.light : ThemeMode.dark,
      );
    }

    void switchLocale(Locale locale) {
      final preferencesNotifier = ref.read(
        preferencesNotifierProvider.notifier,
      );

      preferencesNotifier.setLocale(locale);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => toggleThemeMode(isDarkMode),
          ),
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: switchLocale,
            itemBuilder: (BuildContext context) {
              return AppLocalizations.supportedLocales.map((Locale locale) {
                return PopupMenuItem<Locale>(
                  value: locale,
                  child: Text(locale.languageCode.toUpperCase()),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.appDescription),
      ),
    );
  }
}
