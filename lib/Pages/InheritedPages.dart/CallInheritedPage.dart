import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Pages/InheritedPages.dart/inhritedCounterPage.dart';

class CallInheritedWidget extends StatefulWidget {
  const CallInheritedWidget({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CallInheritedWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            MyInheritedWidget(counter: _counter, child: const CounterWidget()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("${MyInheritedWidget.of(context)!.counter}",
        style: const TextStyle(fontSize: 100));
  }
}
