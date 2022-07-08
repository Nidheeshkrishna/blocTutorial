import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_applicationgoogle_drive/Modeles/GetserviceArea.dart';
import 'package:http/http.dart' as http;

import '../utilities/Urls.dart';

Future<GetLocationModel> fetchlocation(String cityID, String pincode) async {
  Map data = {
    'CityID': cityID,
    'Pincode': pincode,
  };
  var url = Uri.parse(
    Urls.apiUrl + 'getlocations',
  );

  final http.Response response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    if (kDebugMode) {
      print('responseJson : $responseJson');
    }

    return GetLocationModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed ');
  }
}
