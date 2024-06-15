import 'package:flutter/material.dart';
import 'package:my_portfolio/features/about_me/widgets/skill_pil.dart';
import '/constants/constants.dart';
import '../../../constants/app_sizes.dart';

class AboutMeInfoContainer extends StatefulWidget {
  const AboutMeInfoContainer({super.key});

  @override
  State<AboutMeInfoContainer> createState() => _AboutMeInfoContainerState();
}

class _AboutMeInfoContainerState extends State<AboutMeInfoContainer>
    with TickerProviderStateMixin {
  final Map<String, String> _infoMap = const {
    'name': 'Abrar Ahmed Shahok',
    'title': 'Mobile App Developer',
    'bio':
        "I am currently a third-year Computer Science student. I've been into programming for three years, experimenting with various languages like C and C++. Currently, I'm immersed in Dart and Flutter, with 1+ year(s) of dedicated experience. My passion lies in mobile app development, and I'm enthusiastic about steering my career in that direction."
  };

  // Technical Skills
  List<String> programmingLanguages = [
    'Dart',
    'C',
    'C++',
    'Java',
    'JavaScript',
  ];

  List<String> frameworks = [
    'Flutter',
    'NodeJS',
    'ExpressJS',
  ];

  List<String> databasesAndORMs = [
    'MySQL (Sequelize)',
    'Firebase',
    'MongoDB (Mongoose)',
  ];

  List<String> others = [
    'Data Structures and Algorithms (DSA)',
    'Linux',
    'Clean Architecture',
    'MVC',
    'Deep Linking',
    'State Management (Bloc, Provider)',
    'Data Serialization (Freezed, JsonSerializable)',
    'Routing (Auto-Router, Go-Router)',
    'Rest APIs (HTTP)',
    'Object-Oriented Programming (OOP)',
    'Git & GitHub',
    'Google Play Console',
    'Google Ads Integration',
  ];

  // Soft Skills
  List<String> softSkills = [
    'Problem Solving',
    'Team Work',
    'Dedication',
    'Strong Communication'
  ];

  // Languages
  List<String> languages = [
    'Urdu - Efficient',
    'Sindhi - Efficient',
    'English - Intermediate'
  ];

  bool _hovering = false;

  List<AnimationController>? _controllers;
  List<Animation<Offset>>? _offsetAnimations;
  List<Animation<double>>? _fadeAnimations;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _controllers = List<AnimationController>.generate(
      7,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      )..forward(),
    );
    _offsetAnimations = _controllers!.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0.0, -0.05),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ));
    }).toList();
    _fadeAnimations = _controllers!.map((controller) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ));
    }).toList();
  }

  @override
  void didUpdateWidget(covariant AboutMeInfoContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    for (var controller in _controllers!) {
      controller.dispose();
    }
    _initAnimations();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, List<String>>> skillsList = [
      {'Programming Languages': programmingLanguages},
      {'Frameworks': frameworks},
      {'Databases & ORMS': databasesAndORMs},
      {'Others': others},
      {'Soft Skills': softSkills},
      {'Languages': languages},
    ];
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: FadeTransition(
        opacity: _fadeAnimations![0],
        child: SlideTransition(
          position: _offsetAnimations![0],
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 700,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: _hovering
                  ? Border.all(color: primaryColor, width: 0.2)
                  : null,
              boxShadow: _hovering
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      )
                    ]
                  : [],
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_infoMap['name']} | ${_infoMap['title']}',
                    style: firaCode.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                  gapH4,
                  Text(
                    _infoMap['bio']!,
                    style: firaCode.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  ...skillsList.asMap().entries.map(
                    (entry) {
                      return FadeTransition(
                        opacity: _fadeAnimations![entry.key + 1],
                        child: SlideTransition(
                          position: _offsetAnimations![entry.key + 1],
                          child: SkillsSection(
                            title: entry.value.keys.first,
                            items: entry.value.values.first,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  final String title;
  final List<String> items;

  const SkillsSection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH32,
        Text(
          title,
          style: firaCode.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        gapH8,
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: items
              .map(
                (skill) => SkillPil(skill: skill),
              )
              .toList(),
        ),
      ],
    );
  }
}
