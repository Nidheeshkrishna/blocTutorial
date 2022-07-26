import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Pages/InheritedWidgetPage.dart';

class InheritedMain extends StatelessWidget {
  const InheritedMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Option 1
    return const Scaffold(body: MyScreen());

    // Option 2
    /*
    return NetworkHandler(
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const CardWidget()),
       );
     */
  }
}
