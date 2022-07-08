import 'dart:convert';

class GetLocationModel {
  GetLocationModel({
    required this.result,
  });

  List<Result> result;

  factory GetLocationModel.fromJson(String str) =>
      GetLocationModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetLocationModel.fromMap(Map<String, dynamic> json) =>
      GetLocationModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.oalOfficeAddressId,
    required this.oalOfficeName,
    required this.oalOfficeType,
    required this.oalState,
    required this.oalDistrict,
    required this.oalPincode,
    required this.oalCityId,
    required this.oalRouteId,
  });

  int oalOfficeAddressId;
  String oalOfficeName;
  String oalOfficeType;
  String oalState;
  String oalDistrict;
  String oalPincode;
  int oalCityId;
  int oalRouteId;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        oalOfficeAddressId: json["OAL_Office_Address_ID"],
        oalOfficeName: json["OAL_Office_Name"],
        oalOfficeType: json["OAL_Office_Type"],
        oalState: json["OAL_State"],
        oalDistrict: json["OAL_District"],
        oalPincode: json["OAL_Pincode"],
        oalCityId: json["OAL_City_ID"],
        oalRouteId: json["OAL_RouteID"],
      );

  Map<String, dynamic> toMap() => {
        "OAL_Office_Address_ID": oalOfficeAddressId,
        "OAL_Office_Name": oalOfficeName,
        "OAL_Office_Type": oalOfficeType,
        "OAL_State": oalState,
        "OAL_District": oalDistrict,
        "OAL_Pincode": oalPincode,
        "OAL_City_ID": oalCityId,
        "OAL_RouteID": oalRouteId,
      };
}
