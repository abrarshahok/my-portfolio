import 'package:my_portfolio/constants/constants.dart';

import '/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData icon;
  final Color? iconColor;
  final TextStyle? textStyle;

  const CustomButton({
    required this.onTap,
    required this.text,
    required this.icon,
    this.textStyle,
    this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroudColor,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p12,
          vertical: Sizes.p4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: firaCode.copyWith(
                fontSize: 16,
                color: primaryColor,
              ),
            ),
            gapW8,
            Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
