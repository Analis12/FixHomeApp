// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.displayName,
    this.email,
    this.password,
    this.role,
    this.identification,
  });

  String? displayName;
  String? email;
  String? password;
  String? role;
  String? identification;

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "email": email,
        "password": password,
        "role": role,
        "identification": identification
      };
}
