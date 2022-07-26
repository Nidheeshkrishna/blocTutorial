class Result {
  String? firstName;
  String? lastName;
  String? age;

  Result({this.firstName, this.lastName, this.age});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        age: json['age'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
      };
}
