import 'package:flutter/material.dart';
import 'package:my_portfolio/features/about_me/widgets/skill_pil.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({
    super.key,
    required this.experienceInfo,
    this.isEducation = false,
  });
  final bool isEducation;

  final Map<String, dynamic> experienceInfo;

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 700,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    widget.experienceInfo['duration']!,
                    style: firaCode.copyWith(fontSize: 12),
                  ),
                ),
                gapW20,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.isEducation) ...[
                        Text(
                          '${widget.experienceInfo['title']}',
                          style: firaCode.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                        ),
                        gapH4,
                        SizedBox(
                          width: 400,
                          child: Text(
                            widget.experienceInfo['company']!,
                            style: firaCode.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ] else
                        Text(
                          '${widget.experienceInfo['title']!} | ${widget.experienceInfo['company']!}',
                          style: firaCode.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                        ),
                      gapH12,
                      if (widget.experienceInfo['responsibilities'] != null)
                        Text(
                          widget.experienceInfo['responsibilities']!,
                          style: firaCode.copyWith(fontSize: 14),
                        ),
                      if (widget.experienceInfo['technologies'] != null)
                        Wrap(
                          spacing: 8, // gap between adjacent chips
                          runSpacing: 4, // gap between lines
                          children:
                              (widget.experienceInfo['technologies'] as List)
                                  .map((skill) => SkillPil(skill: skill))
                                  .toList(),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
