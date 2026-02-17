import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
          final isDynamicColorSupported = lightDynamic != null && darkDynamic != null;

          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return ListView(
                children: [
                  if (isDynamicColorSupported)
                    SwitchListTile(
                      title: Text(AppLocalizations.of(context)!.useDynamicColors),
                      value: themeProvider.useDynamicColors,
                      onChanged: (value) {
                        themeProvider.setUseDynamicColors(value);
                      },
                    ),
                  if (isDynamicColorSupported) const Divider(),
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.themeMode),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SegmentedButton<ThemeMode>(
                      segments: <ButtonSegment<ThemeMode>>[
                        ButtonSegment<ThemeMode>(
                          value: ThemeMode.system,
                          label: Text(AppLocalizations.of(context)!.system),
                          icon: const Icon(Icons.brightness_auto),
                        ),
                        ButtonSegment<ThemeMode>(
                          value: ThemeMode.light,
                          label: Text(AppLocalizations.of(context)!.light),
                          icon: const Icon(Icons.light_mode),
                        ),
                        ButtonSegment<ThemeMode>(
                          value: ThemeMode.dark,
                          label: Text(AppLocalizations.of(context)!.dark),
                          icon: const Icon(Icons.dark_mode),
                        ),
                      ],
                      selected: <ThemeMode>{themeProvider.themeMode},
                      onSelectionChanged: (Set<ThemeMode> newSelection) {
                        themeProvider.setThemeMode(newSelection.first);
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
