import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Imagecordinate extends StatefulWidget {
  const Imagecordinate({super.key});

  @override
  State<Imagecordinate> createState() => _ImagecordinateState();
}

class _ImagecordinateState extends State<Imagecordinate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          onInteractionUpdate: (v) {
            if (kDebugMode) {
              print(v.localFocalPoint.dx);
              print(v.localFocalPoint.dy);
            }
          },
          child: Image.network(
            "https://images.unsplash.com/photo-1643832678771-fdd9ed7638ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDd8Ym84alFLVGFFMFl8fGVufDB8fHx8&auto=format&fit=crop&w=2400&q=60",
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
