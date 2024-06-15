import 'package:flutter/material.dart';
import 'package:my_portfolio/components/custom_text_button.dart';
import 'package:my_portfolio/constants/app_sizes.dart';
import 'package:my_portfolio/constants/breakpoints.dart';
import 'package:my_portfolio/constants/constants.dart';
import 'package:my_portfolio/state/app_bar_state.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);

    if (deviceSize.width > Breakpoint.tablet) {
      return const DesktopHeader();
    } else {
      return MobileHeader(scaffoldKey: scaffoldKey);
    }
  }
}

class MobileHeader extends StatelessWidget {
  const MobileHeader({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final appBarStateProvider = Provider.of<AppBarStateProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            gapW12,
            InkWell(
              onTap: () {
                appBarStateProvider.changeIndex(0);
              },
              child: Text(
                'abrar-ahmed-shahok',
                style: firaCode,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openEndDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: secondaryColor,
              ),
            ),
          ],
        ),
        dividerW,
      ],
    );
  }
}

class DesktopHeader extends StatelessWidget {
  const DesktopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarStateProvider = Provider.of<AppBarStateProvider>(context);
    int currentIndex = appBarStateProvider.currentIndex;
    return Column(
      children: [
        Row(
          children: [
            gapW12,
            InkWell(
              onTap: () {
                appBarStateProvider.changeIndex(0);
              },
              child: Text(
                'abrar-ahmed-shahok',
                style: firaCode,
              ),
            ),
            const Spacer(),
            dividerH,
            CustomTextButton(
              onPressed: () {
                appBarStateProvider.changeIndex(0);
              },
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
            dividerH,
            CustomTextButton(
              onPressed: () {
                appBarStateProvider.changeIndex(1);
              },
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
            dividerH,
            CustomTextButton(
              onPressed: () {
                appBarStateProvider.changeIndex(2);
              },
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
            dividerH,
            CustomTextButton(
              onPressed: () {
                appBarStateProvider.changeIndex(3);
              },
              width: 160,
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
          ],
        ),
        dividerW,
      ],
    );
  }
}
