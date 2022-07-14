import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Pages/bloc/bloc/notification_count_bloc.dart';
import 'package:flutter_applicationgoogle_drive/Pages/person.dart';
import 'package:flutter_applicationgoogle_drive/bloc/NetWorkBloc/network_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/utilities/HelperTools.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:scratcher/scratcher.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotificationCountBloc()..add(ChangeNotificationCount("1")),
      child: Scaffold(
        appBar: AppBar(
            actions: [
              Stack(
                children: <Widget>[
                  IconButton(
                    iconSize: 32,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  Positioned(
                    top: 3,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 15,
                        minHeight: 15,
                      ),
                      child: BlocBuilder<NotificationCountBloc,
                          NotificationCountState>(
                        builder: (context, state) {
                          if (state is NotificationCountSuccess) {
                            return Text(
                              state.count,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center,
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
            title: const Text(
              "Home Page",
            )),
        body: Container(
          color: const Color(0xffC4DFCB),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Page Number 1",
                    style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .60,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 7,
                            itemBuilder: (BuildContext context, int index) {
                              return Image.asset("assets/kalyan.jpg");
                            }),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Page2()));
                      }),
                  Visibility(
                    visible: false,
                    child: Text(
                      "Page Number 1",
                      style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Text(
                      "Page Number 1",
                      style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkBloc, NetworkState>(
      listener: (context, state) {
        if (state is ConnectionSuccess) {
        } else if (state is ConnectionFailure) {
          HelperTools().snackBarWidget(
              context,
              "No NetWork",
              Icons.cloud_off_outlined,
              const Color.fromARGB(255, 150, 100, 26),
              1);
        }
      },
      builder: (context, state) {
        if (state is ConnectionSuccess) {
          return Container(
            color: const Color(0xffC4DFCB),
            child: Hero(
              tag: "demo1",
              flightShuttleBuilder: (flightContext, animation, direction,
                  fromContext, toContext) {
                return const Icon(
                  Icons.access_alarm_rounded,
                  size: 150.0,
                );
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .60,
                  child: SvgPicture.asset("assets/svgold.svg")),
            ),
          );
        } else if (state is ConnectionFailure) {
          return Container(
            color: const Color(0xffC4DFCB),
            child: Hero(
              tag: "demo1",
              flightShuttleBuilder: (flightContext, animation, direction,
                  fromContext, toContext) {
                return const Icon(
                  Icons.access_alarm_rounded,
                  size: 150.0,
                );
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .60,
                  child: const Icon(Icons.cloud_off_outlined)),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
              height: 200.0,
              repeat: true,
              reverse: true,
              animate: true,
            ),
            Lottie.network(
              'https://assets1.lottiefiles.com/private_files/lf30_yQtj4O.json',
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> with TickerProviderStateMixin {
  late final AnimationController _controller;

  late Animation<Offset> _animation;

  late AnimationController slidingBoxAnimationController;

  late Animation<double> slidingAnimation;

  @override
  void initState() {
    super.initState();
    var john = const Person(firstName: 'John', lastName: 'Smith', age: 42);
    var john2 = const Person(firstName: 'John', lastName: 'Smith', age: 42);
    if (kDebugMode) {
      print(john == john2);
    }

    slidingBoxAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidingAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: slidingBoxAnimationController, curve: Curves.fastOutSlowIn));
    slidingBoxAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Offer Page")),
      body: Container(
          color: const Color(0xffC4DFCB),
          child: AnimatedBuilder(
            animation: slidingBoxAnimationController,
            builder: (BuildContext context, Widget? child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Transform(
                    transform: Matrix4.translationValues(
                        slidingAnimation.value * width, 0.0, 0.0),
                    child: Center(
                      child: Container(
                        height: 200,
                        width: 300,
                        color: Colors.red,
                        child: Image.asset(
                          "assets/kalyan.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}

class Scratchclass extends StatefulWidget {
  const Scratchclass({Key? key}) : super(key: key);

  @override
  State<Scratchclass> createState() => _ScratchclassState();
}

class _ScratchclassState extends State<Scratchclass> {
  double _opacity = 0.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Scratch Card In Flutter",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            scratchDialog(context);
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          child: const Text(
            "Scratch Card",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Future<void> scratchDialog(BuildContext context) {
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
              return Scratcher(
                color: Colors.cyan,
                accuracy: ScratchAccuracy.low,
                threshold: 30,
                brushSize: 40,
                onThreshold: () {
                  setState(() {
                    _opacity = 1;
                  });
                },
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 100),
                  opacity: _opacity,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      children: [
                        const Text(
                          "Hurray! you won",
                          style: TextStyle(fontSize: 20),
                        ),
                        Image.asset(
                          "assets/gift.jpeg",
                          width: 100,
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }
}
