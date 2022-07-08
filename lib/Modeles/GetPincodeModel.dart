// To parse this JSON data, do
//
//     final getPincodeModel = getPincodeModelFromMap(jsonString);

import 'dart:convert';

class GetPincodeModel {
  GetPincodeModel({
    required this.result,
  });

  List<PincodeResult> result;

  factory GetPincodeModel.fromJson(String str) =>
      GetPincodeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetPincodeModel.fromMap(Map<String, dynamic> json) => GetPincodeModel(
        result: List<PincodeResult>.from(
            json["result"].map((x) => PincodeResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class PincodeResult {
  PincodeResult({
    required this.pincode,
  });

  String pincode;

  factory PincodeResult.fromJson(String str) =>
      PincodeResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PincodeResult.fromMap(Map<String, dynamic> json) => PincodeResult(
        pincode: json["Pincode"],
      );

  Map<String, dynamic> toMap() => {
        "Pincode": pincode,
      };
}
