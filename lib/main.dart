import 'package:flutter/material.dart';
import 'package:flutter_phasmohelper/main/main/main_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/arb_localization.dart';

void main() {
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('pl', 'PL'),
    );
  }
}

class AppNavigation {
  AppNavigation._();

  static String initial = "/main";
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
      initialLocation: initial,
      debugLogDiagnostics: false,
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          path: "/main",
          builder: (context, state) => MainScreen(),
          name: "main",
        )
      ]);
}
