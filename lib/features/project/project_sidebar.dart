import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_portfolio/state/projects_state.dart';
import '/components/custom_text_button.dart';
import '/constants/app_sizes.dart';
import '/constants/constants.dart';
import 'package:provider/provider.dart';

class ProjectSideBar extends StatefulWidget {
  const ProjectSideBar({super.key});

  @override
  State<ProjectSideBar> createState() => _ProjectSideBarState();
}

class _ProjectSideBarState extends State<ProjectSideBar> {
  bool _isPersonalInfoExpanded = false;

  @override
  void initState() {
    Timer(const Duration(microseconds: 400), () {
      setState(() {
        _isPersonalInfoExpanded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final projectsState = Provider.of<ProjectsState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH12,
        _buildInfoSection(
          title: 'my-projects',
          isExpanded: _isPersonalInfoExpanded,
          topGap: false,
          onTap: () {
            setState(() {
              _isPersonalInfoExpanded = !_isPersonalInfoExpanded;
            });
          },
          children: [
            _buildTextButton(
              'android/ios',
              linkColor,
              projectsState.currentIndex == 0,
              Icons.phone_android,
              () {
                if (projectsState.currentIndex == 0) {
                  return;
                }
                projectsState.changeIndex(0);
              },
            ),
            gapH8,
            _buildTextButton(
              'desktop',
              tercharyColor,
              projectsState.currentIndex == 1,
              Icons.desktop_mac_outlined,
              () {
                if (projectsState.currentIndex == 1) {
                  return;
                }
                projectsState.changeIndex(1);
              },
            ),
            gapH8,
            _buildTextButton(
              'cli',
              lightGreen,
              projectsState.currentIndex == 2,
              Icons.code,
              () {
                if (projectsState.currentIndex == 2) {
                  return;
                }
                projectsState.changeIndex(2);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
    required List<Widget> children,
    double height = 110,
    bool topGap = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topGap) ...[
          dividerW,
          gapH12,
        ],
        Row(
          children: [
            gapW4,
            Icon(
              isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
              color: isExpanded ? primaryColor : secondaryColor,
            ),
            InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.only(left: Sizes.p12),
                child: Text(
                  title,
                  style: firaCode.copyWith(
                      color: isExpanded ? primaryColor : secondaryColor),
                ),
              ),
            ),
          ],
        ),
        gapH12,
        dividerW,
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? height : 0,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
            children: children,
          ),
        ),
      ],
    );
  }

  CustomTextButton _buildTextButton(
    String text,
    Color iconColor,
    bool isSelected,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return CustomTextButton(
      alignmentGeometry: Alignment.centerLeft,
      onPressed: onPressed,
      child: Row(
        children: [
          gapW12,
          Icon(icon, size: 20, color: iconColor),
          gapW12,
          Text(
            text,
            style:
                isSelected ? firaCode.copyWith(color: Colors.white) : firaCode,
          ),
        ],
      ),
    );
  }
}
