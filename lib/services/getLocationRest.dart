import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Modeles/getpincodemodel.dart';
import '../utilities/Urls.dart';

Future<GetPincodeModel> fetchPincode(String cityID) async {
  final response = await http.post(
    Uri.parse(Urls.getPincodes),
    body: jsonEncode(<String, String>{
      'CityID': cityID,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    if (kDebugMode) {
      print('responseJson : $responseJson');
    }

    return GetPincodeModel.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}
