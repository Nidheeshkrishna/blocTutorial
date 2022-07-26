import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Pages/Websockets.dart';

class InheritedNetworkHandler extends InheritedWidget {
  final bool isNetworkAvailable;

  const InheritedNetworkHandler(
      {required this.isNetworkAvailable, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedNetworkHandler oldWidget) {
    return oldWidget.isNetworkAvailable != isNetworkAvailable;
  }

  // Helper method to find the Inherited widget up the tree
  static InheritedNetworkHandler? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedNetworkHandler>();
}

class NetworkHandler extends StatefulWidget {
  const NetworkHandler({Key? key}) : super(key: key);

  // Ignore this
  // final Widget child;

  @override
  _NetworkHandlerState createState() => _NetworkHandlerState();
}

class _NetworkHandlerState extends State<NetworkHandler> {
  bool isNetworkAvailable = false;
  final Connectivity _connectivity = Connectivity();

  // Store the connectivity Stream
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    // Check current connectivity value
    _checkConnectivity();
    super.initState();

    // Subscribe to the connectivity Stream, to get a update on connectivity change
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  dispose() {
    super.dispose();

    _connectivitySubscription.cancel();
  }

  // Checks if the device is connected to Mobile internet or Wi-fi
  Future<void> _checkConnectivity() async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    setState(() {
      isNetworkAvailable = connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi;
    });
  }

  // Whenever connection is changed check for the updated status
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      isNetworkAvailable = result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedNetworkHandler(
        isNetworkAvailable: isNetworkAvailable, child: const ChildWidget123());
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool? isNetworkAvailable =
        InheritedNetworkHandler.of(context)?.isNetworkAvailable;
    debugPrint("Network Availability $isNetworkAvailable");

    return Scaffold(
      body: Container(
        color: isNetworkAvailable == true ? Colors.pinkAccent : Colors.blue,
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget(
      {Key? key, required this.child, required this.message})
      : super(key: key, child: child);

  @override
  final Widget child;

  // message of our inherited widget class
  final String message;

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.message != message;
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GFG gghjjj"),
        backgroundColor: Colors.green,
      ),
      body: MyInheritedWidget(
        // passing the message as string
        message: "Hey GEEKS hhhff",
        child: Builder(
          builder: (BuildContext innerContext) {
            return Center(
                child: Text(
              // using the message of our inherited widget using of()
              MyInheritedWidget.of(innerContext).message,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ));
          },
        ),
      ),
    );
  }
}
