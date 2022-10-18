import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Pages/AlbumHomePage.dart';
import 'package:flutter_applicationgoogle_drive/Pages/AnimationDemo/borderAnimation.dart';
import 'package:flutter_applicationgoogle_drive/Pages/BottamNavigatiionPage/BottamnavigationPages.dart';
import 'package:flutter_applicationgoogle_drive/Pages/BottamnavigationUi.dart';
import 'package:flutter_applicationgoogle_drive/Pages/ContextLessNavigation/ContextLessNavigationPage.dart';
import 'package:flutter_applicationgoogle_drive/Pages/CustomCalender.dart';
import 'package:flutter_applicationgoogle_drive/Pages/EmailValidationPage.dart';
import 'package:flutter_applicationgoogle_drive/Pages/ImageWithWaterMark.dart';
import 'package:flutter_applicationgoogle_drive/Pages/InheritedPages.dart/CallInheritedPage.dart';
import 'package:flutter_applicationgoogle_drive/Pages/RewardsPage.dart';
import 'package:flutter_applicationgoogle_drive/Pages/SplashScreen.dart';

import '../Pages/AppDrawer.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/page1':
        return MaterialPageRoute(builder: (_) => const SplashPage());
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

      /// MyAppInheritedNetwork()// Network checking
      case '/Inheritedwidget':
        return MaterialPageRoute(builder: (_) => const CallInheritedWidget());
      case '/contextless':
        return MaterialPageRoute(
            builder: (_) => const ContextLessNavigationPage());

      case '/calendar':
        return MaterialPageRoute(builder: (_) => const Calendar());
      case '/FreezedClass':
        return MaterialPageRoute(builder: (_) => const AlbumsScreen());
      case '/counterpage':
        return MaterialPageRoute(builder: (_) => const FormScreen());
      case '/AppDrawer':
        return MaterialPageRoute(builder: (_) => const AppDrawer());
      case '/BorderAnimation':
        return MaterialPageRoute(builder: (_) => const BorderAnimation());
      case '/imaewithwatermark':
        return MaterialPageRoute(builder: (_) => const Imagwithwatermark());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
