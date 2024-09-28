import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resfood_app/routers/router_app.dart';
import 'package:resfood_app/themes/default_theme.dart';

void main() => runApp(const MyApp());

class ThemeStream {
  final _themeController = StreamController<ThemeMode>();

  Stream<ThemeMode> get themeStream => _themeController.stream;

  void changeTheme(ThemeMode mode) {
    _themeController.sink.add(mode);
  }

  void dispose() {
    _themeController.close();
  }
}

final themeStream = ThemeStream();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeMode>(
        stream: themeStream.themeStream,
        initialData: ThemeMode.system,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ResFood App',
            theme: DefaultTheme.lightTheme,
            darkTheme: DefaultTheme.darkTheme,
            themeMode: snapshot.data as ThemeMode,
            initialRoute: '/',
            onGenerateRoute: RouterApp.onGenerateRoute,
          );
        });
  }
}
