import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_sizes.dart';

import '../../constants/constants.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  'Assalam-o-Alaikum, I am',
                  style: firaCode.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              gapH8,
              FittedBox(
                child: Text(
                  'Abrar Ahmed',
                  style: firaCode.copyWith(
                    fontSize: 40,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gapH4,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '> ',
                    style: firaCode.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: tercharyColor,
                    ),
                  ),
                  FittedBox(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Flutter Developer',
                          textStyle: firaCode.copyWith(
                            fontSize: 20,
                            color: tercharyColor,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 300),
                        ),
                      ],
                      repeatForever: true,
                      pause: const Duration(milliseconds: 100),
                      displayFullTextOnTap: false,
                      stopPauseOnTap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
