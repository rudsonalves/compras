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
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: _router,
    );
  }
}
