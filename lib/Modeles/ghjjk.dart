class Ghjjk {
  String? id;
  String? name;
  String? description;
  List<int>? itemModList;

  Ghjjk({this.id, this.name, this.description, this.itemModList});

  factory Ghjjk.fromJson(Map<String, dynamic> json) => Ghjjk(
        id: json['Id'] as String?,
        name: json['Name'] as String?,
        description: json['Description'] as String?,
        itemModList: json['ItemModList'] as List<int>?,
      );

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
        'Description': description,
        'ItemModList': itemModList,
      };
}
