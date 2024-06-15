import 'package:flutter/material.dart';
import 'package:my_portfolio/features/landing_page/intro_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: IntroWidget(),
      // gapW64,
      // ProfileWidget(),
    );
  }
}
