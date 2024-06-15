import 'package:flutter/material.dart';
import '/components/custom_icon_button.dart';
import '/constants/app_sizes.dart';
import '/constants/constants.dart';
import '/constants/image_assets.dart';
import '/features/home/footer.dart';
import '/state/app_bar_state.dart';
import 'package:provider/provider.dart';

import '../../components/custom_text_button.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarStateProvider = Provider.of<AppBarStateProvider>(context);
    String currentPath = appBarStateProvider.currentPath;
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
              appBarStateProvider.setPath('/');
            },
            alignmentGeometry: Alignment.centerLeft,
            child: Text(
              '_hello',
              style: currentPath == '/'
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
              appBarStateProvider.setPath('/about-me');
            },
            alignmentGeometry: Alignment.centerLeft,
            child: Text(
              '_about-me',
              style: currentPath == '/about-me'
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
              appBarStateProvider.setPath('/projects');
            },
            alignmentGeometry: Alignment.centerLeft,
            child: Text(
              '_projects',
              style: currentPath == '/projects'
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
