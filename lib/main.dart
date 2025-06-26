import '/config/dependencies.dart';
import '/main_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final deps = await dependencies();

  runApp(
    MultiProvider(
      providers: deps,
      child: const MainApp(),
    ),
  );
}
