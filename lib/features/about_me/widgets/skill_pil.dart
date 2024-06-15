import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/constants.dart';

class SkillPil extends StatelessWidget {
  const SkillPil({
    super.key,
    required this.skill,
  });
  final String skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: tercharyColor.withOpacity(0.1),
        border: Border.all(color: primaryColor, width: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        skill,
        style: firaCode.copyWith(
          fontSize: 12,
          color: primaryColor,
        ),
      ),
    );
  }
}
