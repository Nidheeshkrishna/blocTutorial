import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  final int counter;

  const MyInheritedWidget(
      {Key? key, required this.counter, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.counter != counter;
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}
