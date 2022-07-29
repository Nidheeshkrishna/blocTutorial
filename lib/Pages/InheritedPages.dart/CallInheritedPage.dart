import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Pages/InheritedPages.dart/inhritedCounterPage.dart';

class CallInheritedWidget extends StatefulWidget {
  const CallInheritedWidget({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CallInheritedWidget> {
  late Person newPerson = Person(0);
  ValueNotifier<int> buttonClickedTimes = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center(
          //   child: MyInheritedWidget(
          //       counter: newPerson.age, child: const CounterWidget()),
          // ),
          ValueListenableBuilder(
            valueListenable: buttonClickedTimes,
            builder: (BuildContext context, int colorValue, Widget? child) {
              return Center(
                child: MyInheritedWidget(
                    counter: colorValue, child: const CounterWidget()),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buttonClickedTimes.value = buttonClickedTimes.value + 1;
        },
        child: const Icon(Icons.add, color: Colors.purpleAccent),
      ),
    );
  }
}

class Person {
  int _age;

  Person(this._age);

  int get age => _age;

  set age(int newValue) {
    if (kDebugMode) {
      print("Happy birthday! You have a new Age.");
    }
    //do some awsome things here when the age changes
    _age = newValue;
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
