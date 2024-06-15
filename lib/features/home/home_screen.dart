import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '/constants/app_sizes.dart';
import '/constants/breakpoints.dart';
import '/constants/constants.dart';
import '/features/home/app_drawer.dart';
import '/features/home/main_screen.dart';
import '/features/home/footer.dart';
import '/features/home/header.dart';
import '/state/app_bar_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);
    final appBarStateProvider = Provider.of<AppBarStateProvider>(context);
    String currentPath = appBarStateProvider.currentPath;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: backgroudColor,
          border: Border.all(color: secondaryColor, width: 0.5),
        ),
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          endDrawer:
              deviceSize.width < Breakpoint.tablet ? const AppDrawer() : null,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Header for my portfolio
              Header(scaffoldKey: _scaffoldKey),
              if (currentPath == '/') const Spacer(),

              // All Main Screens like (Landing Page, About Me, Projects, and Contact Me)
              Expanded(
                child: SingleChildScrollView(
                  padding: currentPath == '/'
                      ? const EdgeInsets.symmetric(horizontal: Sizes.p20)
                      : EdgeInsets.zero,
                  child: const MainScreen(),
                ),
              ),

              // Footer for my portfolio
              if (currentPath == '/') ...[
                const Spacer(),
                const Footer(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
