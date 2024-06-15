import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio/features/project/project_info_widgets.dart';
import 'package:provider/provider.dart';
import '/constants/app_sizes.dart';
import '/constants/constants.dart';

import '../../state/projects_state.dart';

class ProjectInfoScreen extends StatelessWidget {
  const ProjectInfoScreen({super.key});
  String getTitle(int index) {
    if (index == 0) {
      return 'Android/IOS Projects';
    } else if (index == 1) {
      return 'Desktop Projects';
    } else if (index == 2) {
      return 'CLI Projects';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final projectsState = Provider.of<ProjectsState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH12,
        Padding(
          padding: const EdgeInsets.only(left: Sizes.p12),
          child: Text(
            getTitle(projectsState.currentIndex),
            style: firaCode.copyWith(color: primaryColor),
          ),
        ),
        const SizedBox(height: 13),
        dividerW,
        const Padding(
          padding: EdgeInsets.all(10),
          child: ProjectInfoWidgets(),
        ),
      ],
    );
  }
}
