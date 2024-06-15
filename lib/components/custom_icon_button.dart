import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_sizes.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.image,
    required this.onPressed,
    this.color,
  });
  final String image;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
        child: ClipOval(
          child: Image.asset(
            image,
            height: 20,
            color: color,
          ),
        ),
      ),
    );
  }
}
