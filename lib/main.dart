import 'package:compras/config/dependencies.dart';
import 'package:compras/main_app.dart';
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
