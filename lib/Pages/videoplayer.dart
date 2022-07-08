import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class BasicPlayerPage extends StatefulWidget {
  const BasicPlayerPage({Key? key}) : super(key: key);

  @override
  _BasicPlayerPageState createState() => _BasicPlayerPageState();
}

class _BasicPlayerPageState extends State<BasicPlayerPage> {
  @override
  Widget build(BuildContext context) {
    double mediaQueryData = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic player"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Basic player created with the simplest factory method. Shows video from URL.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer.network(
                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Next player shows video from file.",
              textScaleFactor: mediaQueryData,
              style: TextStyle(fontSize: mediaQueryData * 12),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
