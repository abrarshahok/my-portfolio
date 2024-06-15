import 'package:flutter/material.dart';
import 'package:my_portfolio/features/project/project_widget.dart';
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
      'title': 'Keeper',
      'type': 'Associated with Keeper',
      'responsibilities':
          '''Created the entire app for Keeper, a platform offering leave-backed loans. Successfully deployed to the Play Store within 2 weeks. Responsible for converting Figma designs into Flutter app, integrating APIs, implementing deep linking, and ensuring high-quality, clean code.
    ''',
      'url': 'https://play.google.com/store/apps/details?id=com.keeper.app',
      'category': 'android/ios',
      'technologies': [
        'Dart',
        'Flutter',
        'Provider',
        'Clean Architecture',
        'AutoRouter',
        'Rest APIs'
      ],
    },
    {
      'title': 'RoyalsVibe',
      'type': 'Associated with Digiarno (SMC-PRIVATE) LTD',
      'url': 'https://play.google.com/store/apps/details?id=com.royalsvibe.app',
      'responsibilities':
          '''Developed RoyalsVibe, an e-commerce app from scratch. Published the app on the Play Store, focusing on UI/UX design and backend integration.
    ''',
      'category': 'android/ios',
      'technologies': ['Dart', 'Flutter', 'Bloc', 'Go-Router', 'Rest APIs'],
    },
    {
      'title': 'ThankMe',
      'type': 'Associated with Digiarno (SMC-PRIVATE) LTD',
      'url': 'https://play.google.com/store/apps/details?id=com.thankme.app',
      'category': 'android/ios',
      'responsibilities':
          '''Developed ThankMe, an app to enhance shopping experiences by providing ethical product information. Built the app from scratch, focusing on Firebase integration, Google Ads, and UI/UX design.
    ''',
      'technologies': ['Dart', 'Flutter', 'Firebase', 'Google Ads', 'Bloc'],
    },
    {
      'title': 'ConnectHub',
      'type': 'Personal Project',
      'category': 'android/ios',
      'url': 'https://github.com/abrarshahok/Connect-Hub',
      'responsibilities':
          '''Created ConnectHub, a social platform app for sharing thoughts and life experiences. Implemented features like liking, commenting, and user profiles using Cloud Firestore and Firebase Authentication.
    ''',
      'technologies': [
        'Dart',
        'Flutter',
        'Bloc',
        'Cloud Firestore',
        'Firebase Authentication'
      ],
    },
    {
      'title': 'E-Shop App Mobile',
      'type': 'Personal Project',
      'category': 'android/ios',
      'url': 'https://github.com/abrarshahok/E-Shop-App-Flutter',
      'responsibilities':
          '''Created the E-Shop mobile app for seamless shopping experience. Integrated Firebase services for authentication, storage, and REST APIs for dynamic content.
    ''',
      'technologies': ['Dart', 'Flutter', 'Firebase', 'Rest APIs', 'Provider'],
    },
    {
      'title': 'Social Chat App',
      'type': 'Personal Project',
      'category': 'android/ios',
      'url': 'https://github.com/abrarshahok/Social-Chat-App-Flutter',
      'responsibilities':
          '''Developed a Social Chat App for digital hangouts and conversations.Integrated Firebase services for real-time messaging and user authentication.
    ''',
      'technologies': ['Dart', 'Flutter', 'Firebase', 'Provider'],
    },
    {
      'title': 'QR & Barcode Reader & Generator',
      'type': 'Personal Project',
      'category': 'android/ios',
      'url':
          'https://github.com/abrarshahok/Qr-and-Barcode-Scanner-App-Flutter',
      'responsibilities':
          '''Developed a QR & Barcode app for scanning and generating QR codes.Utilized local storage for storing history and implemented barcode scanning functionalities.
    ''',
      'technologies': ['Dart', 'Flutter', 'Local Storage', 'Provider'],
    },
    {
      'title': 'Voice Based Notes App',
      'type': 'Personal Project',
      'category': 'android/ios',
      'url': 'https://github.com/abrarshahok/Voice-Based-Notes-App-Flutter',
      'responsibilities':
          '''Created a Voice Based Notes app for capturing notes via voice or text input.Implemented Firebase Realtime Database for storing and syncing notes across devices.
    ''',
      'technologies': ['Dart', 'Flutter', 'Firebase', 'Rest APIs', 'Provider'],
    },
    {
      'title': 'E-Shop (Admin Panel + User Screen)',
      'type': 'Personal Project',
      'category': 'desktop',
      'url': 'https://github.com/abrarshahok/E-Shop-Desktop',
      'responsibilities':
          '''Developed an E-Shop app with separate admin and user screens. Admin panel includes order management and financial tracking features. User screen allows browsing and purchasing various products using Firebase services.
    ''',
      'technologies': ['Dart', 'Flutter', 'MySQL', 'Firebase', 'Provider'],
    },
    {
      'title': 'Medical Store Management System (GUI)',
      'type': 'Personal Project',
      'category': 'desktop',
      'url':
          'https://github.com/abrarshahok/Medical_Store_Management_System_GUI',
      'responsibilities':
          '''Implemented using Object-Oriented Programming (OOP) concepts and the QT Framework in C++. The system aimed to streamline operations of a medical store, including inventory management, sales tracking, and customer management. Used QT Framework to create a user-friendly interface with features like product catalog management, order processing, and reporting.
    ''',
      'technologies': ['C++', 'QT', 'OOP', 'GUI'],
    },
    {
      'title': 'Student Management System (CLI)',
      'type': 'Personal Project',
      'category': 'cli',
      'url': 'https://github.com/abrarshahok/Student-Management-System-CPP',
      'responsibilities':
          '''I made a Student Management System using OOP and File Handling in C++. OOP helps organize code neatly by grouping related data and functions into classes. File Handling allows the system to read from and write to files, making it possible to store and retrieve student information like names, grades, and more.
    ''',
      'technologies': ['C++', 'OOP', 'File Handling', 'CLI'],
    },
    {
      'title': 'Tic Tac Toe (CLI)',
      'type': 'Personal Project',
      'category': 'cli',
      'url': 'https://github.com/abrarshahok/Tic-Tac-Toe-in-CPP',
      'responsibilities':
          '''I created a Tic Tac Toe game in C++ during my second semester as a personal project. This classic game allowed players to take turns marking Xs and Os on a 3x3 grid until one player achieved three in a row, column, or diagonal. It was a great way to practice programming logic, user input handling, and game state management in C++.
    ''',
      'technologies': ['C++', 'Procedural Programming', 'CLI'],
    },
    {
      'title': 'Scientific Calculator (CLI)',
      'type': 'Personal Project',
      'category': 'cli',
      'url':
          'https://github.com/abrarshahok/Scientific-Calculator-in-C-Language',
      'responsibilities':
          '''I developed a Scientific Calculator using the C programming language as my first semester project. This calculator was capable of performing advanced mathematical functions such as trigonometry, logarithms, and exponentiation. It provided a user-friendly interface for inputting expressions and displayed accurate results, demonstrating my understanding of fundamental programming concepts and mathematical operations in C.
    ''',
      'technologies': ['C Language', 'Procedural Programming', 'CLI'],
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
              child: ProjectWidget(projectInfo: entry.value),
            ),
          );
        },
      ).toList(),
    );
  }
}
