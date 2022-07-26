import 'dart:convert';

import 'package:hive/hive.dart';

class HiveDataMain {
  HiveDataMain({
    required this.result,
  });

  final List<HiveData> result;

  factory HiveDataMain.fromJson(String str) =>
      HiveDataMain.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HiveDataMain.fromMap(Map<String, dynamic> json) => HiveDataMain(
        result:
            List<HiveData>.from(json["result"].map((x) => HiveData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

@HiveType(typeId: 1)
class HiveData extends HiveObject {
  @HiveField(0)
  String firstNmae = "";
  @HiveField(1)
  String lastname = "";
  @HiveField(2)
  String age = "";

  String nameOfLocation = "";
  HiveData(
    this.firstNmae,
    this.lastname,
    this.age,
  );

  HiveData.fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      firstNmae = json["irstName"] ?? "";
      lastname = json["lastName"] ?? "";
      age = json["age"] ?? "";
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstNmae;
    data['lastName'] = lastname;
    data['age'] = age;

    return data;
  }

  factory HiveData.fromMap(Map<String, dynamic> json) => HiveData(
        json["firstName"] ?? 0,
        json["lastName"] ?? "",
        json["age"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "irstName": firstNmae,
        "lastName": lastname,
        "age": age,
      };
}

class UserAdapter extends TypeAdapter<HiveData> {
  @override
  final typeId = 0;

  @override
  HiveData read(BinaryReader reader) {
    return HiveData(
      reader.read(),
      reader.read(),
      reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveData obj) {
    writer.write(obj.firstNmae);
    writer.write(obj.lastname);
    writer.write(obj.age);
  }
}
