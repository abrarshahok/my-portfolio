import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_sizes.dart';
import 'package:my_portfolio/constants/breakpoints.dart';
import 'package:my_portfolio/constants/constants.dart';
import 'package:my_portfolio/features/about_me/screens/info_screen.dart';
import 'package:my_portfolio/features/about_me/widgets/info_side_bar.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    if (deviceSize.width > Breakpoint.tablet) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: InfoSideBar(),
          ),
          SizedBox(
            height: deviceSize.height,
            child: const VerticalDivider(
              color: secondaryColor,
              width: 0.5,
              thickness: 0.5,
            ),
          ),
          const Expanded(
            flex: 2,
            child: InfoScreen(),
          ),
        ],
      );
    } else {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoSideBar(),
          dividerW,
          InfoScreen(),
        ],
      );
    }
  }
}
