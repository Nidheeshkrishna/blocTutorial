import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Pages/InheritedWidgetPage.dart';

class MyAppInheritedNetwork extends StatelessWidget {
  const MyAppInheritedNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Option 1
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NetworkHandler());
  }
}
