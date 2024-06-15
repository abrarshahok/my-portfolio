import 'package:flutter/material.dart';
import 'package:my_portfolio/components/custom_icon_button.dart';
import 'package:my_portfolio/constants/app_sizes.dart';
import 'package:my_portfolio/constants/constants.dart';
import 'package:my_portfolio/constants/image_assets.dart';
import 'package:my_portfolio/features/home/footer.dart';
import 'package:my_portfolio/state/app_bar_state.dart';
import 'package:provider/provider.dart';

import '../../components/custom_text_button.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarStateProvider = Provider.of<AppBarStateProvider>(context);
    int currentIndex = appBarStateProvider.currentIndex;
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: Sizes.p12,
        vertical: Sizes.p8,
      ),
      decoration: BoxDecoration(
        color: backgroudColor,
        border: Border.all(color: secondaryColor, width: 0.5),
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH12,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
            child: Row(
              children: [
                Text(
                  'abrar-ahmed',
                  style: firaCode,
                ),
                const Spacer(),
                CustomIconButton(
                  image: ImageAssets.close,
                  color: secondaryColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          gapH12,
          dividerW,
          gapH12,
          CustomTextButton(
            onPressed: () {
              Navigator.pop(context);
              appBarStateProvider.changeIndex(0);
            },
            alignmentGeometry: Alignment.centerLeft,
            child: Text(
              '_hello',
              style: currentIndex == 0
                  ? firaCode.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    )
                  : firaCode,
            ),
          ),
          gapH12,
          dividerW,
          gapH12,
          CustomTextButton(
            onPressed: () {
              Navigator.pop(context);
              appBarStateProvider.changeIndex(1);
            },
            alignmentGeometry: Alignment.centerLeft,
            child: Text(
              '_about-me',
              style: currentIndex == 1
                  ? firaCode.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    )
                  : firaCode,
            ),
          ),
          gapH12,
          dividerW,
          gapH12,
          CustomTextButton(
            onPressed: () {
              Navigator.pop(context);
              appBarStateProvider.changeIndex(2);
            },
            alignmentGeometry: Alignment.centerLeft,
            child: Text(
              '_projects',
              style: currentIndex == 2
                  ? firaCode.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    )
                  : firaCode,
            ),
          ),
          gapH12,
          dividerW,
          gapH12,
          CustomTextButton(
            onPressed: () {
              Navigator.pop(context);
              appBarStateProvider.changeIndex(3);
            },
            alignmentGeometry: Alignment.centerLeft,
            child: Text(
              '_contact-me',
              style: currentIndex == 3
                  ? firaCode.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    )
                  : firaCode,
            ),
          ),
          gapH12,
          dividerW,
          const Spacer(),
          const Footer(),
        ],
      ),
    );
  }
}
