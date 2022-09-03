import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/utilities/Sizeconfig.dart';

class BorderAnimation extends StatefulWidget {
  const BorderAnimation({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<BorderAnimation> with TickerProviderStateMixin {
  late AnimationController _resizableController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Test"),
          centerTitle: true,
        ),
        body: Center(child: getContainer()));
  }

  getContainer() {
    return SizedBox(
      width: MediaQuery.of(context).size.shortestSide,
      height: MediaQuery.of(context).size.longestSide,
      child: Column(
        children: [
          Text(
              "Not a direct answer, but the solution for me was different. Depends on what you would like to achieve",
              style: TextStyle(fontSize: SizeConfig.textMultiplier * 4)),
          AnimatedBuilder(
              animation: _resizableController,
              builder: (context, child) {
                return DottedBorder(
                  color: Colors.blue,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  strokeWidth: _resizableController.value * 2,
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      child: Image.asset(
                        'assets/gift.png',
                        width: _resizableController.value * 150,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  @override
  void initState() {
    _resizableController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    _resizableController.addStatusListener((animationStatus) {
      switch (animationStatus) {
        case AnimationStatus.completed:
          _resizableController.reverse();
          break;
        case AnimationStatus.dismissed:
          _resizableController.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });
    _resizableController.forward();
    super.initState();
  }
}
