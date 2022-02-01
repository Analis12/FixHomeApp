// To parse this JSON data, do
//
//     final establish = establishFromMap(jsonString);

import 'dart:convert';

Establish establishFromJson(String str) => Establish.fromJson(json.decode(str));

String establishToMap(Establish data) => json.encode(data.toJson());

class Establish {
  Establish({
    this.idEstablecimiento,
    this.name,
    this.description,
    this.quealification,
    this.ownerName,
    this.contactOwner,
    this.imageUrl,
    this.typeEstablish,
  });

  String? idEstablecimiento;
  String? name;
  String? description;
  int? quealification;
  String? ownerName;
  String? contactOwner;
  String? imageUrl;
  String? typeEstablish;

  factory Establish.fromJson(Map<String, dynamic> json) => Establish(
        idEstablecimiento: json["idEstablecimiento"],
        name: json["name"],
        description: json["description"],
        quealification: json["quealification"],
        ownerName: json["ownerName"],
        contactOwner: json["contactOwner"],
        imageUrl: json["imageURL"],
        typeEstablish: json["typeEstablish"],
      );

  Map<String, dynamic> toJson() => {
        "idEstablecimiento": idEstablecimiento,
        "name": name,
        "description": description,
        "quealification": quealification,
        "ownerName": ownerName,
        "contactOwner": contactOwner,
        "imageURL": imageUrl,
        "typeEstablish": typeEstablish,
      };
}
