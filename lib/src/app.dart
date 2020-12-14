import 'package:flutter/material.dart';
import 'package:personalcv/src/features/projects_screen/projects_screen_view.dart';

import 'features/main_screen/main_screen_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => MainScreen(),
        '/projects': (context) => ProjectsScreen(),
//        '/slides': (context) => SlideScreen(),
      },
      initialRoute: '/',
    );
  }
}
