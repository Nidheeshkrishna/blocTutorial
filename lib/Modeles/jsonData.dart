import 'dart:convert';

import 'package:flutter_applicationgoogle_drive/Modeles/DataModel.dart';

Future<HiveDataMain> getData() async {
  final json = {
    "result": [
      {'firstName': "Ram Kumar", "lastName": "P", "age": "45"},
      {'firstName': "Manoj ", 'lastName': "Kumar", "age": "32"}
    ]
  };
  try {
    String s = json.toString();

    final Map<String, dynamic> decoded = jsonDecode(jsonEncode(json));

    return HiveDataMain.fromMap(decoded);
  } catch (e) {
    throw e.toString();
  }
}
