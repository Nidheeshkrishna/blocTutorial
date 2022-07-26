import 'package:flutter/material.dart';

class HelperTools {
  snackBarWidget(
      context, String msg, IconData icons, Color iconcolor, int time) {
    final snackbar = SnackBar(
      elevation: 1,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.purple,
      duration: Duration(seconds: time),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            msg,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlue),
          ),
          Icon(
            icons,
            color: iconcolor,
          )
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  // static Future<bool> displayToast(String message) {
  //   return Fluttertoast.showToast(
  //       msg: message,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIos: 2,
  //       backgroundColor: primaryColor,
  //       textColor: Colors.white,
  //       fontSize: 14.0);
  // }
}
