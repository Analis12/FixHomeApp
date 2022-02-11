// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.displayname,
    this.identificationCard,
    this.fechaNacimiento,
    this.email,
    this.password,
    this.confirmPassword,
    this.rol,
  });

  String? displayname;
  String? identificationCard;
  DateTime? fechaNacimiento;
  String? email;
  String? password;
  String? confirmPassword;
  String? rol;

  Map<String, dynamic> toJson() => {
        "name": displayname,
        "identification_card": identificationCard,
        "fecha_nacimiento": fechaNacimiento,
        "email": email,
        "password": password,
        "confirm_password ": confirmPassword,
        "rol": rol,
      };
}
