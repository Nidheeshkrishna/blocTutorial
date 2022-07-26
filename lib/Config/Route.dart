import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Pages/BottamNavigatiionPage/BottamnavigationPages.dart';
import 'package:flutter_applicationgoogle_drive/Pages/BottamnavigationUi.dart';
import 'package:flutter_applicationgoogle_drive/Pages/FreezedHomePage.dart';

import '../Pages/AppDrawer.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/page1':
        return MaterialPageRoute(builder: (_) => const Page1());
      case '/page2':
        return MaterialPageRoute(builder: (_) => const Page4());
      //CallInheritedWidget
      case '/page3':
        return MaterialPageRoute(
            builder: (_) => const FreezedHomePage(
                  title: 'Freezed',
                ));
      case '/AppDrawer':
        return MaterialPageRoute(builder: (_) => const AppDrawer());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
