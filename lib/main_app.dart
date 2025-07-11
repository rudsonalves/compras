import '/ui/core/themes/theme.dart';
import '/ui/core/themes/util.dart';
import 'package:go_router/go_router.dart';

import '/routing/router.dart';
import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final GoRouter _router;
  late final Brightness brightness;

  @override
  void initState() {
    super.initState();

    _router = router();

    brightness = Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(context, 'Roboto', 'Abyssinica SIL');
    final colorScheme = Theme.of(context).colorScheme;
    final theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      theme: theme.light().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: colorScheme.outline,
          ),
        ),
      ),
      darkTheme: theme.dark().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: colorScheme.outline,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
