import 'dart:convert';

class Data {
  String? id;
  String? name;
  String? description;
  List<int>? itemModList;

  Data({this.id, this.name, this.description, this.itemModList});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        id: data['Id'] as String?,
        name: data['Name'] as String?,
        description: data['Description'] as String?,
        itemModList: data['ItemModList'] as List<int>?,
      );

  Map<String, dynamic> toMap() => {
        'Id': id,
        'Name': name,
        'Description': description,
        'ItemModList': itemModList,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
