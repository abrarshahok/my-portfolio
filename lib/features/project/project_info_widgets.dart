import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '/components/custom_button.dart';
import '/constants/app_sizes.dart';
import '/constants/image_assets.dart';
import '../../constants/constants.dart';
import '../../state/projects_state.dart';
import 'package:provider/provider.dart';

class ProjectInfoWidgets extends StatefulWidget {
  const ProjectInfoWidgets({super.key});

  @override
  State<ProjectInfoWidgets> createState() => _ProjectInfoWidgetsState();
}

class _ProjectInfoWidgetsState extends State<ProjectInfoWidgets>
    with TickerProviderStateMixin {
  final List<Map<String, dynamic>> _projectsInfo = [
    {
      'title': 'Royals Vibe',
      'image': ImageAssets.code,
      'category': 'android/ios',
      'url': 'https://play.google.com/store/apps/details?id=com.royalsvibe.app',
    },
    {
      'title': 'Connect Hub',
      'image': ImageAssets.code,
      'category': 'android/ios',
      'url': 'https://github.com/abrar-ahmed-21bscs20/Connect-Hub',
    },
    {
      'title': 'E-Shop (Desktop)',
      'image': ImageAssets.code,
      'category': 'desktop',
      'url': 'https://github.com/abrar-ahmed-21bscs20/E-Shop-Desktop',
    },
    {
      'title': 'E-Shop',
      'image': ImageAssets.code,
      'category': 'android/ios',
      'url': 'https://github.com/abrar-ahmed-21bscs20/E-Shop-App-Flutter',
    },
    {
      'title': 'Social Chat App',
      'image': ImageAssets.code,
      'category': 'android/ios',
      'url': 'https://github.com/abrar-ahmed-21bscs20/Social-Chat-App-Flutter',
    },
    {
      'title': 'QR & Barcode Reader & Generator',
      'image': ImageAssets.scanner,
      'category': 'android/ios',
      'url':
          'https://github.com/abrar-ahmed-21bscs20/Qr-and-Barcode-Scanner-App-Flutter',
    },
    {
      'title': 'Voice Based Notes App',
      'image': ImageAssets.notesApp,
      'category': 'android/ios',
      'url':
          'https://github.com/abrar-ahmed-21bscs20/Voice-Based-Notes-App-Flutter',
    },
  ];

  List<Map<String, dynamic>> getProjectInfo(String category) {
    return _projectsInfo
        .where((pr) => pr['category'].contains(category))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final projectsState = Provider.of<ProjectsState>(context);
    final category = projectsState.currentIndex == 0
        ? 'android/ios'
        : projectsState.currentIndex == 1
            ? 'desktop'
            : 'cli';
    final loadedProjects = getProjectInfo(category);

    return AllProjects(
      loadedProjects: loadedProjects,
    );
  }
}

class AllProjects extends StatefulWidget {
  const AllProjects({
    super.key,
    required this.loadedProjects,
  });

  final List<Map<String, dynamic>> loadedProjects;

  @override
  State<AllProjects> createState() => _AllProjectsState();
}

class _AllProjectsState extends State<AllProjects>
    with TickerProviderStateMixin {
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
      widget.loadedProjects.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      )..forward(),
    );
    _offsetAnimations = _controllers!.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0.0, -0.1),
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
  void didUpdateWidget(covariant AllProjects oldWidget) {
    super.didUpdateWidget(oldWidget);
    for (var controller in _controllers!) {
      controller.dispose();
    }
    _initAnimations();
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controllers!) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.start,
      children: widget.loadedProjects.asMap().entries.map(
        (entry) {
          return FadeTransition(
            opacity: _fadeAnimations![entry.key],
            child: SlideTransition(
              position: _offsetAnimations![entry.key],
              child: ProjectInfoContainer(project: entry.value),
            ),
          );
        },
      ).toList(),
    );
  }
}

class ProjectInfoContainer extends StatelessWidget {
  const ProjectInfoContainer({super.key, required this.project});

  final Map<String, dynamic> project;
  @override
  Widget build(BuildContext context) {
    final projectsState = Provider.of<ProjectsState>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        border: Border.all(color: primaryColor, width: 0.1),
        color: tercharyColor.withOpacity(0.1),
      ),
      alignment: Alignment.center,
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
            ),
            child: Stack(
              children: [
                Image.asset(
                  project['image'],
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: backgroudColor,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.p12,
                      vertical: Sizes.p4,
                    ),
                    child: Text(
                      project['title'],
                      style: firaCode.copyWith(
                        fontSize: 16,
                        color: primaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomButton(
            onTap: () {
              launchUrl(Uri.parse(project['url']));
            },
            text: 'View Project',
            icon: Icons.launch_rounded,
            iconColor: projectsState.currentIndex == 0
                ? linkColor
                : projectsState.currentIndex == 1
                    ? tercharyColor
                    : lightGreen,
          ),
        ],
      ),
    );
  }
}
