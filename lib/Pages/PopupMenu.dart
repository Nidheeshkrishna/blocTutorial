import 'package:flutter/material.dart';

class PopMenuWithList extends StatefulWidget {
  const PopMenuWithList({Key? key}) : super(key: key);

  @override
  State<PopMenuWithList> createState() => _PopMenuWithListState();
}

class _PopMenuWithListState extends State<PopMenuWithList> {
  @override
  @override
  Widget build(BuildContext context) {
// This is the set context
    return Scaffold(
      appBar: AppBar(title: const Text('Show Popup')),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return  ListTile(leading: GestureDetector(child: const Icon(Icons.more_vert)

              )
              //onTap: (),
              );

              // onTap: showPopup,
            },
          ),
        ],
      ),
    );
  }

  void showMemberMenu() async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(200, 150, 100, 100),
      items: [
        const PopupMenuItem(
          value: 1,
          child: Text(
            "ROHIT",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.green),
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text(
            "REKHA",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.green),
          ),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text(
            "DHRUV",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.green),
          ),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) print(value);
    });
  }
}
