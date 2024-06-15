// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/state/projects_state.dart';
import '/state/app_bar_state.dart';
import '/state/about_me_state.dart';
import '/features/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppBarStateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AboutMeState(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProjectsState(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          buttonTheme: const ButtonThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Consumer<AppBarStateProvider>(
          builder: (context, provider, _) {
            String? path = html.window.location.pathname;
            if (provider.currentPath != path) {
              provider.setPath(path);
            }
            return HomeScreen();
          },
        ),
      ),
    );
  }
}
