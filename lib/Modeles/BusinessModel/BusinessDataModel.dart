// To parse this JSON data, do
//
//     final businessDataModel = businessDataModelFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
part 'BusinessDataModel.freezed.dart';
part 'BusinessDataModel.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String username,
    required String email,
    Address? address,
    @Default('') String phone,
    @Default('') String website,
    Company? company,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    @Default('') String street,
    @Default('') String suite,
    @Default('') String city,
    @Default('') String zipcode,
    //Geo? geo,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

// @freezed
// class Geo with _$Geo {
//   const factory Geo({
//     @Default(0.00) double lat,
//     @Default(0.00) double lng,
//   }) = _Geo;

//   factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
// }

@freezed
class Company with _$Company {
  const factory Company({
    @Default('') String name,
    @Default('') String catchPhrase,
    @Default('') String bs,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
