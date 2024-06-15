import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '/features/about_me/widgets/skill_pil.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({super.key, required this.projectInfo});

  final Map<String, dynamic> projectInfo;

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 720,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border:
              _hovering ? Border.all(color: primaryColor, width: 0.2) : null,
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  )
                ]
              : [],
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${widget.projectInfo['title']!} | ',
                    style: firaCode.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: 'View Project',
                    style: firaCode.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: linkColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(Uri.parse(widget.projectInfo['url']));
                      },
                  ),
                  const WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Icon(
                        Icons.launch_rounded,
                        color: linkColor,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            gapH4,
            Text(
              widget.projectInfo['type']!,
              style: firaCode.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH12,
            if (widget.projectInfo['responsibilities'] != null)
              Text(
                widget.projectInfo['responsibilities']!,
                style: firaCode.copyWith(fontSize: 14),
              ),
            if (widget.projectInfo['technologies'] != null)
              Wrap(
                spacing: 8, // gap between adjacent chips
                runSpacing: 4, // gap between lines
                children: (widget.projectInfo['technologies'] as List)
                    .map((skill) => SkillPil(skill: skill))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
