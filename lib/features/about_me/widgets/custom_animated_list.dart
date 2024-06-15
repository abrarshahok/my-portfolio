import 'package:flutter/cupertino.dart';
import 'experience_widget.dart';

class CustomAnimatedList extends StatefulWidget {
  final List<Map<String, dynamic>> infoList;
  final bool isEducation;

  const CustomAnimatedList(
      {super.key, required this.infoList, this.isEducation = false});

  @override
  State<CustomAnimatedList> createState() => _CustomAnimatedListState();
}

class _CustomAnimatedListState extends State<CustomAnimatedList>
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
      widget.infoList.length,
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
  void didUpdateWidget(covariant CustomAnimatedList oldWidget) {
    super.didUpdateWidget(oldWidget);
    for (var controller in _controllers!) {
      controller.dispose();
    }
    _initAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.infoList
          .asMap()
          .map((index, experience) => MapEntry(
                index,
                FadeTransition(
                  opacity: _fadeAnimations![index],
                  child: SlideTransition(
                    position: _offsetAnimations![index],
                    child: ExperienceWidget(
                      experienceInfo: experience,
                      isEducation: widget.isEducation,
                    ),
                  ),
                ),
              ))
          .values
          .toList(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controllers!) {
      controller.dispose();
    }
  }
}
