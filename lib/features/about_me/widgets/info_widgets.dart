import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'about_me_info_container.dart';
import '/state/about_me_state.dart';
import 'package:provider/provider.dart';

import 'custom_animated_list.dart';

class InfoWidgets extends StatelessWidget {
  InfoWidgets({super.key});

  final List<Map<String, dynamic>> _experienceInfoList = [
    {
      'title': 'Flutter Developer',
      'company': 'Keeper',
      'location': 'Bengaluru, Karnataka, India',
      'duration': 'April 2024 - Present',
      'responsibilities':
          '''Created the entire Keeper app and deployed it to the Play Store within the first 2 weeks. Responsible for converting Figma designs into Flutter app UI, integrating APIs, implementing deep linking, and ensuring high-quality, clean code.
    ''',
      'technologies': [
        'Dart',
        'Flutter',
        'Firebase',
        'Rest APIs (HTTP)',
        'Figma to Flutter',
        'Deep Linking',
        'Google Play Console'
      ],
    },
    {
      'title': 'Flutter Developer',
      'company': 'Digiarno (SMC-PRIVATE) LTD',
      'location': 'Islamabad, Pakistan',
      'duration': 'February 2024 - April 2024',
      'responsibilities':
          '''Responsible for developing high-quality mobile applications using Flutter. Currently involved in the development of two applications, one of which has been successfully deployed on the Google Play Store. Tasks include UI/UX design, backend API integration, and ensuring overall user experience improvement.
    ''',
      'technologies': [
        'Dart',
        'Flutter',
        'Bloc',
        'Firebase',
        'Provider',
        'AdMob',
        'Google Play Console'
      ],
    },
    {
      'title': 'Flutter Developer Intern',
      'company': 'Superlabs',
      'location': 'India',
      'duration': 'October 2023 - December 2023',
      'responsibilities':
          '''Led the development of the Augmntx app, a global platform for hiring developers and fostering collaboration. Successfully launched the first version on the Play Store.
    ''',
      'technologies': [
        'Dart',
        'Flutter',
        'Firebase',
        'Provider',
        'Google Play Console'
      ],
    },
    {
      'title': 'Flutter Developer Intern',
      'company': 'Techlancerz',
      'location': 'Hyderabad, Pakistan',
      'duration': 'October 2023 - December 2023',
      'responsibilities':
          '''Played a crucial role in developing the "ElfaSpace" app, focusing on design and implementation for a seamless user experience. Developed over 20 pages App.
    ''',
      'technologies': [
        'Dart',
        'Flutter',
        'Firebase',
        'Provider',
        'Figma to Flutter'
      ],
    },
  ];

  final List<Map<String, dynamic>> _educationInfoList = [
    {
      'title': 'Bachelor of Science in Computer Science',
      'company':
          'Quaid-e-Awam University of Engineering, Science and Technology, Nawabshah, Sindh, Pakistan',
      'duration': '2021 - Present',
    },
    {
      'title': 'College (Pre-Engineering)',
      'company':
          'Government Sarwari Islamia Degree College, Hala New, Sindh, Pakistan',
      'duration': '2019 - 2021',
    },
    {
      'title': 'High School (Science)',
      'company':
          'Hack Public High School and College, Hala New, Sindh, Pakistan',
      'duration': '2017 - 2019',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final aboutMeState = Provider.of<AboutMeState>(context);
    if (aboutMeState.currentIndex == 0) {
      return const AboutMeInfoContainer();
    } else if (aboutMeState.currentIndex == 1) {
      return CustomAnimatedList(infoList: _experienceInfoList);
    } else if (aboutMeState.currentIndex == 2) {
      return CustomAnimatedList(
        infoList: _educationInfoList,
        isEducation: true,
      );
    }
    return Container();
  }
}
