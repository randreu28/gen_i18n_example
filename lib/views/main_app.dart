import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_i18n_example/view_model/preferences.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(preferencesViewModelProvider);
    final isDarkMode = preferences.value?.themeMode == ThemeMode.dark;
    final viewModel = ref.read(preferencesViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => viewModel.toggleThemeMode(isDarkMode),
          ),
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: viewModel.switchLocale,
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
