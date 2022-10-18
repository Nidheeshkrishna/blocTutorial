import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/CarasoulBloc/carasoul_bloc.dart';
import 'package:flutter_applicationgoogle_drive/Const/AppThemes.dart';
import 'package:flutter_applicationgoogle_drive/Pages/AppDrawer.dart';
import 'package:flutter_applicationgoogle_drive/Pages/Widgets/TextFormfield.dart';
import 'package:flutter_applicationgoogle_drive/Pages/bloc/bloc/notification_count_bloc.dart';
import 'package:flutter_applicationgoogle_drive/bloc/NetWorkBloc/network_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/utilities/HelperTools.dart';
import 'package:flutter_applicationgoogle_drive/utilities/Sizeconfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';
import 'package:scratcher/scratcher.dart';

var iconJson = {
  "type": "Row",
  "mainAxisAlignment": "spaceAround",
  "children": [
    {"type": "Icon", "data": "fa.google", "color": "#000000", "size": 36.0},
    {
      "type": "Icon",
      "data": "favorite",
      "color": "#FFC0CB",
      "size": 24.0,
      "semanticLabel": "Text to announce in accessibility modes"
    },
    {"type": "Icon", "data": "audiotrack", "color": "#008000", "size": 30.0},
    {"type": "Icon", "data": "beach_access", "color": "#0000FF", "size": 36.0}
  ]
};

class CircularTween extends RectTween {
  @override
  final Rect? begin;
  @override
  final Rect? end;

  CircularTween({
    required this.begin,
    required this.end,
  });

  @override
  Rect lerp(double t) {
    double startWidthCenter = begin!.left + (begin!.width / 2);
    double startHeightCenter = begin!.top + (begin!.height / 2);
    return Rect.fromCircle(
      center: Offset(startWidthCenter, startHeightCenter),
      radius: 100,
    );
  }
}

class CustomRectTween extends RectTween {
  CustomRectTween({required Rect? begin, required Rect? end})
      : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    double height = end!.top - begin!.top;
    double width = end!.left - begin!.left;

    double animatedX = begin!.left + (t * width);
    double animatedY = begin!.top + (t * height);

    return Rect.fromLTWH(animatedX, animatedY, 1, 1);
  }
}

class HeroDemoPage extends StatefulWidget {
  final int index;
  const HeroDemoPage({Key? key, required this.index}) : super(key: key);

  @override
  State<HeroDemoPage> createState() => _HeroDemoPageState();
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
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
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .60,
                child: Hero(
                    tag: 'imageHero',
                    child: SvgPicture.asset("assets/svgold.svg"))),
          );
        } else if (state is ConnectionFailure) {
          return Container(
            color: const Color(0xffC4DFCB),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .60,
                child: const Icon(Icons.cloud_off_outlined)),
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

class Page5 extends StatefulWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  State<Page5> createState() => _Page5State();
}

class Scratchclass extends StatefulWidget {
  const Scratchclass({Key? key}) : super(key: key);

  @override
  State<Scratchclass> createState() => _ScratchclassState();
}

class _HeroDemoPageState extends State<HeroDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
          tag: 'imageHero' + widget.index.toString(),
          child: Center(child: Image.asset("assets/kalyan.jpg"))),
      // your child ,
    );
  }
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotificationCountBloc()..add(ChangeNotificationCount("1")),
      child: Scaffold(
        drawer: const AppDrawer(),
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
        body: ListView(
          children: [
            Container(
              color: const Color(0xffC4DFCB),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Page Number 1",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).textScaleFactor *
                                MediaQuery.of(context).size.width *
                                .060),
                      ),
                      InkWell(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .60,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 7,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HeroDemoPage(index: index)));
                                    },
                                    child: InteractiveViewer(
                                      // boundary of image
                                      boundaryMargin: const EdgeInsets.all(20),
                                      minScale: 0.1,
                                      maxScale: 1.6,
                                      child: SizedBox(
                                        height: 180,
                                        width: 500,
                                        child: Hero(
                                            tag: 'imageHero' + index.toString(),
                                            createRectTween: (begin, end) {
                                              return _createRectTween(
                                                  begin, end);

                                              // CircularTween(
                                              //     begin: begin, end: end);
                                            },
                                            flightShuttleBuilder: (
                                              BuildContext flightContext,
                                              Animation<double> animation,
                                              HeroFlightDirection
                                                  flightDirection,
                                              BuildContext fromHeroContext,
                                              BuildContext toHeroContext,
                                            ) {
                                              return Image.asset(
                                                  "assets/kalyan.jpg");
                                            },
                                            child: Image.asset(
                                                "assets/kalyan.jpg")),
                                      ),
                                    ));
                              }),
                        ),
                      ),
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
          ],
        ),
      ),
    );
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initialization();
  }

  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return CustomRectTween(begin: begin, end: end);
  }
}

class _Page4State extends State<Page4> with TickerProviderStateMixin {
  late final AnimationController _controller;

  late Animation<Offset> _animation;

  late AnimationController slidingBoxAnimationController;

  late Animation<double> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Slide Animation")),
      body: ListView(
        children: [
          Container(
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
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // var john = const Person(firstName: 'John', lastName: 'Smith', age: 42);
    // var john2 = const Person(firstName: 'John', lastName: 'Smith', age: 42);
    // if (kDebugMode) {
    //   print(john == john2);
    // }

    slidingBoxAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidingAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: slidingBoxAnimationController,
        curve: Curves.fastLinearToSlowEaseIn));
    slidingBoxAnimationController.forward();
  }
}

class _Page5State extends State<Page5> with TickerProviderStateMixin {
  late final Animation<double> _animation;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Offer Page")),
      body: ListView(
        children: [
          Container(
            color: const Color(0xffC4DFCB),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizeTransition(
                  sizeFactor: _animation,
                  axis: Axis.horizontal,
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
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // // var john = const Person(firstName: 'John', lastName: 'Smith', age: 42);
    // // var john2 = const Person(firstName: 'John', lastName: 'Smith', age: 42);
    // if (kDebugMode) {
    //   print(john == john2);
    // }

    late final AnimationController _controller = AnimationController(
      // duration: const Duration(seconds: 0),
      animationBehavior: AnimationBehavior.normal,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }
}

class _ScratchclassState extends State<Scratchclass> {
  double _opacity = 0.0;

  int sum = 0;

  var activeIndex;

  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(width: 200, height: 40, child: _buildPassword()),
            ),
            const Text("0"),
            InkWell(
              child: const Icon(Icons.add),
              onTap: () {
                setState(() {
                  sum = sum + 1;
                });
              },
            ),
            Card(
              child: SizedBox(
                width: SizeConfig.screenwidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/gift.png",
                          height: SizeConfig.screenheight * .20,
                          width: SizeConfig.screenwidth * .20,
                          fit: BoxFit.contain,
                        )),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  bool status = checkRestaurentStatus("09:00AM", "09:44AM");
                  log('Closing Time $status');
                  // if (kDebugMode) {
                  //   print("Closing Time" + "$status");
                  // }
                  scratchDialog(context);
                },

                // style: ElevatedButton.styleFrom(
                //     primary: Colors.purple,
                //     padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                //     textStyle:
                //         const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                child: Text("Scratch Card",
                    style: AppTextStyle.appFont(
                        fontWeight: FontWeight.normal, color: Colors.white)),
              ),
            ),
            BlocConsumer<CarasoulBloc, CarasoulState>(
              listener: ((context, state) {
                if (state is ChangeCarasoulEvent) {
                  // final fetchlocation =
                  //     BlocProvider.of<>(context);
                  // fetchlocation
                  //     .add(FetchServiceAraea("9", newValue.toString()));
                }
              }),
              builder: (context, state) {
                if (state is CarasoulSuccessState) {
                  return Stack(
                    children: [
                      GFCarousel(
                        items: imageList.map(
                          (url) {
                            return Container(
                              margin: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                child: Image.network(
                                  url,
                                  fit: BoxFit.cover,
                                  width: SizeConfig.screenwidth,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        autoPlay: true,
                        // viewportFraction: 0.1,
                        aspectRatio: 16 / 9,
                        enlargeMainPage: true,
                        onPageChanged: (index) {
                          BlocProvider.of<CarasoulBloc>(context)
                              .add(CarasoulSuccEvent(index, ""));
                        },
                      ),
                      Positioned(
                        left: 100,
                        bottom: 10,
                        child: DotsIndicator(
                          dotsCount: state.imageList.length,
                          position: state.index.toDouble(),
                          decorator: const DotsDecorator(
                            color: Colors.grey,
                            // Inactive dot colors
                            activeColor: Colors.blue, // Àctive dot colors
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is CarasouInitial) {
                  return const SizedBox();
                } else {
                  return Container(
                    width: 200,
                    height: 40,
                    color: Colors.red,
                  );
                }
              },
            ),
            // GFFloatingWidget(
            //   child: const GFIconBadge(
            //       child: GFAvatar(
            //         size: GFSize.LARGE,
            //         backgroundImage: AssetImage('assets/kalyan.jpg'),
            //       ),
            //       counterChild: GFBadge(
            //         text: '12',
            //         shape: GFBadgeShape.circle,
            //       )),
            //   body: const Text('body or any kind of widget here..'),
            //   verticalPosition: MediaQuery.of(context).size.height * 0.2,
            //   horizontalPosition: MediaQuery.of(context).size.width * 0.8,
            // ),
            // const GFImageOverlay(
            //   height: 200,
            //   width: 200,
            //   shape: BoxShape.circle,
            //   image: AssetImage('assets/kalyan.jpg'),
            //   boxFit: BoxFit.cover,
            // )
          ],
        ),
      ),
    );
  }

  bool checkRestaurentStatus(String openTime, String closedTime) {
    //NOTE: Time should be as given format only
    //10:00PM
    //10:00AM

    // 01:60PM ->13:60
    //Hrs:Min
    //if AM then its ok but if PM then? 12+time (12+10=22)

    TimeOfDay timeNow = TimeOfDay.now();
    String openHr = openTime.substring(0, 2);
    String openMin = openTime.substring(3, 5);
    String openAmPm = openTime.substring(5);
    TimeOfDay timeOpen;
    if (openAmPm == "AM") {
      //am case
      if (openHr == "12") {
        //if 12AM then time is 00
        timeOpen = TimeOfDay(hour: 00, minute: int.parse(openMin));
      } else {
        timeOpen =
            TimeOfDay(hour: int.parse(openHr), minute: int.parse(openMin));
      }
    } else {
      //pm case
      if (openHr == "12") {
//if 12PM means as it is
        timeOpen =
            TimeOfDay(hour: int.parse(openHr), minute: int.parse(openMin));
      } else {
//add +12 to conv time to 24hr format
        timeOpen =
            TimeOfDay(hour: int.parse(openHr) + 12, minute: int.parse(openMin));
      }
    }

    String closeHr = closedTime.substring(0, 2);
    String closeMin = closedTime.substring(3, 5);
    String closeAmPm = closedTime.substring(5);

    TimeOfDay timeClose;

    if (closeAmPm == "AM") {
      //am case
      if (closeHr == "12") {
        timeClose = TimeOfDay(hour: 0, minute: int.parse(closeMin));
      } else {
        timeClose =
            TimeOfDay(hour: int.parse(closeHr), minute: int.parse(closeMin));
      }
    } else {
      //pm case
      if (closeHr == "12") {
        timeClose =
            TimeOfDay(hour: int.parse(closeHr), minute: int.parse(closeMin));
      } else {
        timeClose = TimeOfDay(
            hour: int.parse(closeHr) + 12, minute: int.parse(closeMin));
      }
    }

    int nowInMinutes = timeNow.hour * 60 + timeNow.minute;
    int openTimeInMinutes = timeOpen.hour * 60 + timeOpen.minute;
    int closeTimeInMinutes = timeClose.hour * 60 + timeClose.minute;

//handling day change ie pm to am
    if ((closeTimeInMinutes - openTimeInMinutes) < 0) {
      closeTimeInMinutes = closeTimeInMinutes + 1440;
      if (nowInMinutes >= 0 && nowInMinutes < openTimeInMinutes) {
        nowInMinutes = nowInMinutes + 1440;
      }
      if (openTimeInMinutes < nowInMinutes &&
          nowInMinutes < closeTimeInMinutes) {
        return true;
      }
    } else if (openTimeInMinutes < nowInMinutes &&
        nowInMinutes < closeTimeInMinutes) {
      return true;
    }

    return false;
  }

  @override
  void initState() {
    super.initState();
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

  // late final TextEditingController _passwordController =
  //     TextEditingController();

  // late final FocusNode _passwordControllerFocus = FocusNode();

  Widget _buildPassword() {
    return TextFormFieldWidget(
      hintText: "Password",
      obscureText: false,
      textInputType: TextInputType.visiblePassword,
      actionKeyboard: TextInputAction.done,
      functionValidate: commonValidation,
      // controller: _passwordController,
      // focusNode: _passwordControllerFocus,
      onSubmitField: () {},
      parametersValidate: "Please enter password.",
      prefixIcon: const Icon(Icons.keyboard_hide),
    );
  }
}
