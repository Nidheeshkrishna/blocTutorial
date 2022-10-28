import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/utilities/Sizeconfig.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(const MyApp());
}

// this function should be either top level(outside class) or static method
void computationallyExpensiveTask(SendPort sendPort) {
  if (kDebugMode) {
    print('heavy work started');
  }
  var sum = 0;
  for (var i = 0; i <= 1000000000; i++) {
    sum += i;
  }
  if (kDebugMode) {
    print('heavy work finished');
  }
  //Remember there is no return, we are sending sum to listener defined defore.
  sendPort.send(sum);
}

@pragma('vm:entry-point')
void computeFunction(String arg) async {
  getTemporaryDirectory().then((dir) {
    if (kDebugMode) {
      print("Temporary directory in compute function : $dir with arg $arg");
    }
  });
}

@pragma('vm:entry-point')
void isolate1(String arg) async {
  await FlutterIsolate.spawn(isolate2, "hello2");

  getTemporaryDirectory().then((dir) {
    print("isolate1 temporary directory: $dir");
  });
  Timer.periodic(const Duration(seconds: 1),
      (timer) => print("Timer Running From Isolate 1"));
}

@pragma('vm:entry-point')
void isolate2(String arg) {
  getTemporaryDirectory().then((dir) async {
    print("isolate2 temporary directory: $dir");

    await FlutterDownloader.initialize(debug: true);
    FlutterDownloader.registerCallback(AppWidget.downloaderCallback);

    final taskId = await FlutterDownloader.enqueue(
        url:
            "https://raw.githubusercontent.com/rmawatson/flutter_isolate/master/README.md",
        savedDir: dir.path);
  });
  Timer.periodic(const Duration(seconds: 1),
      (timer) => print("Timer Running From Isolate 2"));
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: SizeConfig.screenwidth,
          height: SizeConfig.screenheight,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ElevatedButton(
                  child: Text('Spawn isolates'),
                  onPressed: createIsolate,
                ),
                ElevatedButton(
                  child: const Text('Check running isolates'),
                  onPressed: () async {
                    final isolates = await FlutterIsolate.runningIsolates;
                    await showDialog(
                        builder: (ctx) {
                          return Center(
                              child: Container(
                                  width: SizeConfig.screenwidth,
                                  height: SizeConfig.screenheight * .50,
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                      children: isolates
                                              .map((i) => Text(i))
                                              .cast<Widget>()
                                              .toList() +
                                          [
                                            ElevatedButton(
                                                child: const Text("Close"),
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                })
                                          ])));
                        },
                        context: context);
                  },
                ),
                ElevatedButton(
                  child: const Text('Kill all running isolates'),
                  onPressed: () async {
                    await FlutterIsolate.killAll();
                  },
                ),
                ElevatedButton(
                  child: const Text('Run in compute function'),
                  onPressed: () async {
                    await flutterCompute(computeFunction, "foo");
                  },
                ),
              ]),
        ),
      ),
    );
  }

  Future<void> _run() async {
    print(
        "Temp directory in main isolate : ${(await getTemporaryDirectory()).path}");
    final isolate = await FlutterIsolate.spawn(isolate1, "hello");
    Timer(const Duration(seconds: 5), () {
      if (kDebugMode) {
        print("Pausing Isolate 1");
      }
      isolate.pause();
    });
    Timer(const Duration(seconds: 10), () {
      if (kDebugMode) {
        print("Resuming Isolate 1");
      }
      isolate.resume();
    });
    Timer(const Duration(seconds: 20), () {
      if (kDebugMode) {
        print("Killing Isolate 1");
      }
      isolate.kill();
    });
  }

  static void downloaderCallback(
      String id, DownloadTaskStatus status, int progress) {
    if (kDebugMode) {
      print("progress: $progress");
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class SimpleIsolate extends StatelessWidget {
  const SimpleIsolate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CircularProgressIndicator(),
            ElevatedButton(
              child: const Text('start'),
              onPressed: () async {
                //ReceivePort is to listen for the isolate to finish job
                final receivePort = ReceivePort();
                // here we are passing method name and sendPort instance from ReceivePort as listener
                await Isolate.spawn(
                    computationallyExpensiveTask, receivePort.sendPort);

                //It will listen for isolate function to finish
                receivePort.listen((sum) {
                  if (kDebugMode) {
                    print(sum);
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Plugin example app'),
            ),
            body: const AppWidget()));
  }
}
