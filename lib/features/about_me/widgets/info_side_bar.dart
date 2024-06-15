import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio/components/custom_text_button.dart';
import 'package:my_portfolio/constants/app_sizes.dart';
import 'package:my_portfolio/constants/constants.dart';
import 'package:my_portfolio/constants/image_assets.dart';
import 'package:my_portfolio/state/about_me_state.dart';
import 'package:provider/provider.dart';

class InfoSideBar extends StatefulWidget {
  const InfoSideBar({super.key});

  @override
  State<InfoSideBar> createState() => _InfoSideBarState();
}

class _InfoSideBarState extends State<InfoSideBar> {
  bool _isPersonalInfoExpanded = false;
  bool _isContactInfoExpanded = false;

  @override
  void initState() {
    Timer(const Duration(microseconds: 400), () {
      setState(() {
        _isPersonalInfoExpanded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final aboutMeState = Provider.of<AboutMeState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH12,
        _buildInfoSection(
          title: 'personal-info',
          isExpanded: _isPersonalInfoExpanded,
          topGap: false,
          onTap: () {
            setState(() {
              _isPersonalInfoExpanded = !_isPersonalInfoExpanded;
            });
          },
          children: [
            _buildTextButton(
              'bio',
              tercharyColor,
              aboutMeState.currentIndex == 0,
              () {
                if (aboutMeState.currentIndex == 0) {
                  return;
                }
                aboutMeState.changeIndex(0);
              },
            ),
            gapH8,
            _buildTextButton(
              'experience',
              secondaryColor,
              aboutMeState.currentIndex == 1,
              () {
                if (aboutMeState.currentIndex == 1) {
                  return;
                }
                aboutMeState.changeIndex(1);
              },
            ),
            gapH8,
            _buildTextButton(
              'education',
              lightGreen,
              aboutMeState.currentIndex == 2,
              () {
                if (aboutMeState.currentIndex == 2) {
                  return;
                }
                aboutMeState.changeIndex(2);
              },
            ),
          ],
        ),
        _buildInfoSection(
          title: 'contact-info',
          isExpanded: _isContactInfoExpanded,
          onTap: () {
            setState(() {
              _isContactInfoExpanded = !_isContactInfoExpanded;
            });
          },
          height: 80,
          children: [
            _buildContactInfoRow(ImageAssets.email, 'abrarshahok@gmail.com'),
            gapH8,
            _buildContactInfoRow(ImageAssets.phone, '+92 310-3877376'),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
    required List<Widget> children,
    double height = 110,
    bool topGap = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topGap) ...[
          dividerW,
          gapH12,
        ],
        Row(
          children: [
            gapW4,
            Icon(
              isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
              color: isExpanded ? primaryColor : secondaryColor,
            ),
            InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.only(left: Sizes.p12),
                child: Text(
                  title,
                  style: firaCode.copyWith(
                      color: isExpanded ? primaryColor : secondaryColor),
                ),
              ),
            ),
          ],
        ),
        gapH12,
        dividerW,
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? height : 0,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
            children: children,
          ),
        ),
      ],
    );
  }

  CustomTextButton _buildTextButton(
    String text,
    Color iconColor,
    bool isSelected,
    VoidCallback onPressed,
  ) {
    return CustomTextButton(
      alignmentGeometry: Alignment.centerLeft,
      onPressed: onPressed,
      child: Row(
        children: [
          gapW12,
          Icon(Icons.folder, size: 20, color: iconColor),
          gapW12,
          Text(
            text,
            style:
                isSelected ? firaCode.copyWith(color: Colors.white) : firaCode,
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfoRow(String asset, String text) {
    return Row(
      children: [
        gapW16,
        Image.asset(asset, width: 20, height: 20),
        gapW12,
        Text(
          text,
          style: firaCode,
        ),
      ],
    );
  }
}
