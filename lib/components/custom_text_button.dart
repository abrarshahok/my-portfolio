import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio/constants/app_sizes.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.width = 130,
    this.alignmentGeometry = Alignment.center,
  });
  final Widget child;
  final VoidCallback onPressed;
  final double width;
  final AlignmentGeometry alignmentGeometry;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width == 0 ? null : width,
        alignment: alignmentGeometry,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
        child: child,
      ),
    );
  }
}
