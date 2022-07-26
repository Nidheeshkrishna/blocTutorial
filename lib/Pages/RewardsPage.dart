import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/utilities/Sizeconfig.dart';
import 'package:scratcher/scratcher.dart';

class RewardPag extends StatefulWidget {
  const RewardPag({Key? key}) : super(key: key);

  @override
  State<RewardPag> createState() => _RewardPagState();
}

class _RewardPagState extends State<RewardPag> {
  double _opacity = 0;
  late ConfettiController _controllerTopCenter;
  @override
  void initState() {
    _controllerTopCenter =
        ConfettiController(duration: const Duration(milliseconds: 5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 227, 186),
      appBar: AppBar(title: const Text("Reward page")),
      body: SizedBox(
        width: SizeConfig.screenwidth,
        height: SizeConfig.screenheight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Opacity(
                    //semi red clippath with more height and with 0.5 opacity
                    opacity: 0.5,
                    child: ClipPath(
                      clipper: GreenClipper(), //set our custom wave clipper
                      child: Container(
                        color: Colors.deepOrangeAccent,
                        height: 200,
                      ),
                    ),
                  ),
                  ClipPath(
                      clipper: GreenClipper(),
                      child: Container(
                          padding: const EdgeInsets.only(bottom: 2),
                          // color: Colors.red,
                          height: 180,
                          width: SizeConfig.screenwidth,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images (1).jpeg",
                            width: SizeConfig.screenwidth * 99,
                            height: 180,
                            fit: BoxFit.cover,
                          ))),
                ],
              ),
              Container(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0),
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: InkWell(
                            onTap: () {
                              scratchDialog1(context);
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: ListView(
                                  children: [
                                    // const Text(
                                    //   "Hurray! you won",
                                    //   style: TextStyle(fontSize: 20),
                                    // ),
                                    Image.asset(
                                      "assets/gift.jpeg",
                                      width: 100,
                                      height: 100,
                                    ),
                                    Text(
                                      "Text factor",
                                      style: TextStyle(
                                          fontSize: 20 *
                                              MediaQuery.of(context)
                                                  .textScaleFactor *
                                              .5),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //  Scratcher(
  //                           color: Colors.cyan,
  //                           accuracy: ScratchAccuracy.low,
  //                           threshold: 20,
  //                           brushSize: 80,
  //                           onChange: (value) {
  //                             if (value == 100) {
  //                               _controllerTopCenter.play();
  //                             }
  //                           },
  //                           onThreshold: () {
  //                             setState(() {
  //                               _opacity = 1;
  //                             });
  //                           },
  //                           onScratchEnd: () {},
  //                           child: AnimatedOpacity(
  //                             duration: const Duration(milliseconds: 50),
  //                             opacity: _opacity,));

  Future<void> scratchDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Scratcher(
                        enabled: true,
                        rebuildOnResize: true,
                        image: Image.asset(
                          "assets/scratchandwin.jpeg",
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.6,
                          fit: BoxFit.fill,
                        ),
                        accuracy: ScratchAccuracy.low,
                        threshold: 30,
                        brushSize: 40,
                        onThreshold: () {
                          setState(() {
                            _opacity = 1;
                          });
                        },
                        onChange: (value) {
                          if (value > 90) {
                            _controllerTopCenter.play();
                          } else if (value == 100) {
                            _controllerTopCenter.stop();
                          }
                        },
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 100),
                          opacity: _opacity,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Image.asset(
                                    "assets/cele.png",
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Better luck Next Time",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: _controllerTopCenter,
                      blastDirection: -pi / 2, // radial value - RIGHT
                      emissionFrequency: 0.6,
                      maxBlastForce: 20,
                      blastDirectionality: BlastDirectionality.explosive,
                      canvas: MediaQuery.of(context).size,
                      minimumSize: const Size(10,
                          10), // set the minimum potential size for the confetti (width, height)
                      maximumSize: const Size(20,
                          15), // set the maximum potential size for the confetti (width, height)
                      numberOfParticles: 5,
                      gravity: 0.1,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> scratchDialog1(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: Column(
              children: const [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "You Earned Gift",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Scratcher(
                        accuracy: ScratchAccuracy.low,
                        threshold: 30,
                        brushSize: 40,
                        image: Image.asset(
                          "assets/scratchandwin.jpeg",
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.6,
                          fit: BoxFit.fill,
                        ),
                        onThreshold: () {
                          setState(() {
                            _opacity = 1;
                          });
                        },
                        onChange: (value) {
                          if (value > 90) {
                            _controllerTopCenter.play();
                          } else if (value == 99) {
                            _controllerTopCenter.stop();
                          }
                        },
                        onScratchEnd: () async {
                          await Future.delayed(const Duration(seconds: 5), () {
                            Navigator.pop(context);
                          });
                        },
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 100),
                          opacity: _opacity,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Image.asset(
                                    "assets/cele.png",
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "You've won",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        color: Colors.blue),
                                  ),
                                ),
                                const Text(
                                  "\$10",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ShowBlastingWidget(
                        controllerTopCenter: _controllerTopCenter),
                  ],
                ),
              );
            }),
          );
        });
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);
    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);
    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}

class ShowBlastingWidget extends StatelessWidget {
  const ShowBlastingWidget({
    Key? key,
    required ConfettiController controllerTopCenter,
  })  : _controllerTopCenter = controllerTopCenter,
        super(key: key);

  final ConfettiController _controllerTopCenter;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConfettiWidget(
        confettiController: _controllerTopCenter,
        blastDirection: -pi / 2, // radial value - RIGHT
        emissionFrequency: 0.6,
        maxBlastForce: 20,
        blastDirectionality: BlastDirectionality.explosive,
        canvas: MediaQuery.of(context).size,
        minimumSize: const Size(10,
            10), // set the minimum potential size for the confetti (width, height)
        maximumSize: const Size(20,
            15), // set the maximum potential size for the confetti (width, height)
        numberOfParticles: 5,
        gravity: 0.1,
      ),
    );
  }
}

Align buildConfettiWidget(controller, double blastDirection) {
  return Align(
    alignment: Alignment.topCenter,
    child: ConfettiWidget(
      maximumSize: const Size(30, 30),
      shouldLoop: false,
      confettiController: controller,
      blastDirection: blastDirection,
      blastDirectionality: BlastDirectionality.directional,
      maxBlastForce: 20, // set a lower max blast force
      minBlastForce: 8, // set a lower min blast force
      emissionFrequency: 1,
      // a lot of particles at once
      gravity: 1,
    ),
  );
}

class StarGun extends StatefulWidget {
  const StarGun(
    ConfettiController controllerTopCenter, {
    Key? key,
  }) : super(key: key);

  @override
  State<StarGun> createState() => _StarGunState();
}

class _StarGunState extends State<StarGun> {
  late ConfettiController _controllerTopCenter;

  @override
  void initState() {
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: _controllerTopCenter,
      blastDirection: pi, // radial value - LEFT
      particleDrag: 0.05, // apply drag to the confetti
      emissionFrequency: 0.05, // how often it should emit
      numberOfParticles: 20, // number of particles to emit
      gravity: 0.05, // gravity - or fall speed
      shouldLoop: false,
      colors: const [
        Colors.green,
        Colors.blue,
        Colors.pink
      ], // manually specify the colors to be used
    );
  }
}

class GreenClipper extends CustomClipper<Path> {
  bool reverse = false;

  bool flip = false;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
