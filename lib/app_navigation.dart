import 'package:flutter/material.dart';
import 'package:flutter_phasmohelper/main/cubit/main_screen.dart';
import 'package:flutter_phasmohelper/start/cubic/start_screen.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = "/start";
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: "/start",
        builder: (context, state) => StartScreen(),
        name: "start",
        routes: [
          GoRoute(
            path: "main",
            builder: (context, state) => MainScreen(),
            name: "main",
          ),
        ],
      ),
    ],
  );
}
