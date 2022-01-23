// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.name,
    this.lastName,
    this.identificationCard,
    this.fechaNacimiento,
    this.email,
    this.password,
    this.confirmPassword,
  });

  String? name;
  String? lastName;
  String? identificationCard;
  DateTime? fechaNacimiento;
  String? email;
  String? password;
  String? confirmPassword;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        lastName: json["last_name"],
        identificationCard: json["identification_card"],
        fechaNacimiento: json["fecha_nacimiento"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirm_password "],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "last_name": lastName,
        "identification_card": identificationCard,
        "fecha_nacimiento": fechaNacimiento,
        "email": email,
        "password": password,
        "confirm_password ": confirmPassword,
      };
}
