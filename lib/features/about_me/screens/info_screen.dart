import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio/constants/app_sizes.dart';
import 'package:my_portfolio/constants/constants.dart';
import 'package:my_portfolio/features/about_me/widgets/info_widgets.dart';
import 'package:my_portfolio/state/about_me_state.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});
  String getTitle(int index) {
    if (index == -1) {
      return 'Welcome there :)';
    } else if (index == 0) {
      return 'About Me';
    } else if (index == 1) {
      return 'My Experience';
    } else if (index == 2) {
      return 'My Education';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final aboutMeState = Provider.of<AboutMeState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH12,
        Padding(
          padding: const EdgeInsets.only(left: Sizes.p12),
          child: Text(
            getTitle(aboutMeState.currentIndex),
            style: firaCode.copyWith(color: primaryColor),
          ),
        ),
        const SizedBox(height: 13),
        dividerW,
        Padding(
          padding: const EdgeInsets.all(10),
          child: InfoWidgets(),
        ),
      ],
    );
  }
}
