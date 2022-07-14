// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
// This file is "main.dart"

import 'package:flutter/foundation.dart';
part 'person.freezed.dart';
part 'person.g.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.

@freezed
class Person with _$Person {
  const factory Person({
    required String firstName,
    required String lastName,
    required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}
