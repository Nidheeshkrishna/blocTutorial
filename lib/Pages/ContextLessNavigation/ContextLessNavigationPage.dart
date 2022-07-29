import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/utilities/NavigationService.dart';
import 'package:flutter_applicationgoogle_drive/utilities/Sizeconfig.dart';

class ContextLessNavigationPage extends StatefulWidget {
  const ContextLessNavigationPage({Key? key}) : super(key: key);

  @override
  State<ContextLessNavigationPage> createState() =>
      _ContextLessNavigationPageState();
}

class _ContextLessNavigationPageState extends State<ContextLessNavigationPage> {
  NavigationService navService = NavigationService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: SizeConfig.screenwidth,
            height: SizeConfig.screenheight,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: () {
                    navService.pushReplacementNamed("/page1");
                  },
                  child: const Text("Click Here"))
            ]),
          ),
        ),
      ),
    );
  }
}
