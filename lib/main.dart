import 'package:flutter/material.dart';
import 'package:my_portfolio/state/projects_state.dart';
import 'package:provider/provider.dart';
import 'package:my_portfolio/state/app_bar_state.dart';
import 'package:my_portfolio/state/about_me_state.dart';
import 'package:my_portfolio/features/home/home_screen.dart';

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
        home: HomeScreen(),
      ),
    );
  }
}
