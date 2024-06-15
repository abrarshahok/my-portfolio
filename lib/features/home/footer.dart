import 'package:flutter/material.dart';
import 'package:my_portfolio/components/custom_icon_button.dart';
import 'package:my_portfolio/components/custom_text_button.dart';
import 'package:my_portfolio/constants/app_sizes.dart';
import 'package:my_portfolio/constants/breakpoints.dart';
import 'package:my_portfolio/constants/constants.dart';
import 'package:my_portfolio/constants/image_assets.dart';
import 'package:url_launcher/url_launcher.dart';

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
              onPressed: () {
                launchUrl(Uri.parse(
                    'https://www.linkedin.com/in/abrar-ahmed-21bscs20/'));
              },
              image: ImageAssets.linkedIn,
            ),
            gapW8,
            dividerH,
            gapW8,
            CustomIconButton(
              onPressed: () {
                launchUrl(Uri.parse('https://instagram.com/abrar_shahok'));
              },
              image: ImageAssets.instagram,
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
                onPressed: () {
                  launchUrl(Uri.parse('https://github.com/abrarshahok'));
                },
                width: 0,
                child: Row(
                  children: [
                    Text(
                      '@abrarshahok ',
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
                onPressed: () {
                  launchUrl(Uri.parse('https://github.com/abrarshahok'));
                },
                image: ImageAssets.github,
              ),
            gapW8,
          ],
        ),
      ],
    );
  }
}
