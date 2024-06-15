import 'package:flutter/material.dart';
import '/components/custom_text_button.dart';
import '/constants/app_sizes.dart';
import '/constants/breakpoints.dart';
import '/state/app_bar_state.dart';
import 'package:my_portfolio/constants/constants.dart';
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
                appBarStateProvider.setPath('/');
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
    String currentPath = appBarStateProvider.currentPath;
    return Column(
      children: [
        Row(
          children: [
            gapW12,
            InkWell(
              onTap: () {
                appBarStateProvider.setPath('/');
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
                appBarStateProvider.setPath('/');
              },
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
            dividerH,
            CustomTextButton(
              onPressed: () {
                appBarStateProvider.setPath('/about-me');
              },
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
            dividerH,
            CustomTextButton(
              onPressed: () {
                appBarStateProvider.setPath('/projects');
              },
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
          ],
        ),
        dividerW,
      ],
    );
  }
}
