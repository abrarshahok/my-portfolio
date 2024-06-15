import 'package:flutter/material.dart';
import 'package:my_portfolio/components/custom_icon_button.dart';
import 'package:my_portfolio/components/custom_text_button.dart';
import 'package:my_portfolio/constants/app_sizes.dart';
import 'package:my_portfolio/constants/breakpoints.dart';
import 'package:my_portfolio/constants/constants.dart';
import 'package:my_portfolio/constants/image_assets.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool desktop = MediaQuery.sizeOf(context).width > Breakpoint.tablet;
    return Column(
      children: [
        dividerW,
        Row(
          mainAxisAlignment: !desktop
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            gapW12,
            Text(
              'find me in:',
              style: firaCode,
            ),
            desktop ? gapW32 : const Spacer(),
            dividerH,
            gapW8,
            CustomIconButton(
              onPressed: () {},
              image: ImageAssets.linkedIn,
            ),
            gapW8,
            dividerH,
            gapW8,
            CustomIconButton(
              onPressed: () {},
              image: ImageAssets.instagram,
            ),
            gapW8,
            dividerH,
            gapW8,
            CustomIconButton(
              onPressed: () {},
              image: ImageAssets.twitter,
            ),
            gapW8,
            dividerH,
            if (desktop) ...[
              const Spacer(),
              dividerH,
            ],
            gapW8,
            if (desktop)
              CustomTextButton(
                onPressed: () {},
                width: 0,
                child: Row(
                  children: [
                    Text(
                      '@ abrar-ahmed-21bscs20 ',
                      style: firaCode,
                    ),
                    Image.asset(
                      ImageAssets.github,
                      height: 20,
                    )
                  ],
                ),
              )
            else
              CustomIconButton(
                onPressed: () {},
                image: ImageAssets.github,
              ),
            // if (showSpacer)
            gapW8,
          ],
        ),
      ],
    );
  }
}
