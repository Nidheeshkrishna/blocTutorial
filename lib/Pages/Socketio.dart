import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIoPge extends StatefulWidget {
  const SocketIoPge({Key? key}) : super(key: key);

  @override
  State<SocketIoPge> createState() => _SocketIoPgeState();
}

class _SocketIoPgeState extends State<SocketIoPge> {
  late IO.Socket socket;
  void Connect() {
    //socket=IO.io("http:192.168.1.38:50")
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
