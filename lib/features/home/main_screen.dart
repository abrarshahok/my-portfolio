import 'package:flutter/material.dart';
import 'package:my_portfolio/features/about_me/screens/about_me_screen.dart';
import 'package:my_portfolio/features/contact/contact_screen.dart';
import 'package:my_portfolio/features/landing_page/landing_page.dart';
import 'package:my_portfolio/features/project/projects_screen.dart';
import 'package:my_portfolio/state/app_bar_state.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarStateProvider = Provider.of<AppBarStateProvider>(context);
    int currentIndex = appBarStateProvider.currentIndex;
    if (currentIndex == 0) {
      return const LandingPage();
    } else if (currentIndex == 1) {
      return const AboutMeScreen();
    } else if (currentIndex == 2) {
      return const ProjectsScreen();
    } else if (currentIndex == 3) {
      return const ContactScreen();
    } else {
      return Container();
    }
  }
}
