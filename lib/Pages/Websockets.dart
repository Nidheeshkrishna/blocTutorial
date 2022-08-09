import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Pages/InheritedWidgetPage.dart';

class ChildWidget123 extends StatelessWidget {
  const ChildWidget123({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? isNetworkAvailable = MyInheritedWidget?.of(context).message;

    return Scaffold(
      body: Container(
        color: isNetworkAvailable != null ? Colors.white : Colors.blue,
      ),
    );
  }
}
