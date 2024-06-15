import 'package:flutter/material.dart';
import 'package:my_portfolio/features/about_me/screens/about_me_screen.dart';
import 'package:my_portfolio/features/landing_page/landing_page.dart';
import 'package:my_portfolio/features/project/projects_screen.dart';
import 'package:my_portfolio/state/app_bar_state.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarStateProvider = Provider.of<AppBarStateProvider>(context);
    String currentPath = appBarStateProvider.currentPath;
    if (currentPath == '/') {
      return const LandingPage();
    } else if (currentPath == '/about-me') {
      return const AboutMeScreen();
    } else if (currentPath == '/projects') {
      return const ProjectsScreen();
    } else {
      return Container();
    }
  }
}
