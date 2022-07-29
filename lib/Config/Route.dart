import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Pages/AlbumHomePage.dart';
import 'package:flutter_applicationgoogle_drive/Pages/BottamNavigatiionPage/BottamnavigationPages.dart';
import 'package:flutter_applicationgoogle_drive/Pages/BottamnavigationUi.dart';
import 'package:flutter_applicationgoogle_drive/Pages/ContextLessNavigation/ContextLessNavigationPage.dart';
import 'package:flutter_applicationgoogle_drive/Pages/InheritedPages.dart/CallInheritedPage.dart';
import 'package:flutter_applicationgoogle_drive/Pages/RewardsPage.dart';

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
      // FreezedHomePage(
      //             title: 'Freezed',
      //           )
      case '/page3':
        return MaterialPageRoute(builder: (_) => const Page3());
      case '/reward':
        return MaterialPageRoute(builder: (_) => const RewardPag());
      case '/Inheritedwidget':
        return MaterialPageRoute(builder: (_) => const CallInheritedWidget());
      case '/contextless':
        return MaterialPageRoute(
            builder: (_) => const ContextLessNavigationPage());
      case '/counterpage':
        return MaterialPageRoute(builder: (_) => const AlbumsScreen());
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
