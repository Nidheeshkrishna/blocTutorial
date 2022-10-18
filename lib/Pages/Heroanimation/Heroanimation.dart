import 'package:flutter/material.dart';




class HeroFirstScreen extends StatelessWidget {
  const HeroFirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Hero(
              tag: "HeroOne",
              child: Icon(
                Icons.image,
                size: 50.0,
              ),

            ),
            ElevatedButton(
              child: const Text('Go to second screen'),
              onPressed: () {
                Navigator.push(context, CustomPageRoute(const SecondScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Hero(
                tag: "HeroOne",
                child: Icon(
                  Icons.image,
                  size: 150.0,
                ),
              ),
              ElevatedButton(
                child: const Text('Back to first screen!'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
      ),
    );
  }
}

class CustomPageRoute<T> extends PageRoute<T> {

  final Widget child;

  CustomPageRoute(this.child);

  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(seconds: 2);

  @override
  Widget buildPage(
BuildContext context,
    Animation<double> animation,
Animation<double> secondaryAnimation
) {
return FadeTransition(
opacity: animation,
child: child,
);
}
}