import 'package:flutter/material.dart';
import 'package:flutter_phasmohelper/share/app_navigation.dart';
import 'package:flutter_phasmohelper/config/di.dart';
import 'package:flutter_phasmohelper/share/theme.dart';
import 'package:flutter_gen/gen_l10n/arb_localization.dart';

void main() {
  setupDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      routerConfig: AppNavigation.router,
      theme: ThemeData(
          useMaterial3: true, colorScheme: MaterialTheme.lightScheme()),
      darkTheme: ThemeData(
          useMaterial3: true, colorScheme: MaterialTheme.darkScheme()),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('pl', 'PL'),
    );
  }
}
