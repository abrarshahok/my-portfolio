import 'package:flutter/material.dart';
import '/constants/app_sizes.dart';
import '/constants/breakpoints.dart';
import '/constants/constants.dart';
import '/features/project/project_info_screen.dart';
import '/features/project/project_sidebar.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    if (deviceSize.width > Breakpoint.tablet) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: ProjectSideBar(),
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
            child: ProjectInfoScreen(),
          ),
        ],
      );
    } else {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectSideBar(),
          dividerW,
          ProjectInfoScreen(),
        ],
      );
    }
  }
}
