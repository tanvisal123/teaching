// To parse this JSON data, do
//
//     final nodeModel = nodeModelFromJson(jsonString);

import 'dart:convert';

List<NodeModel> nodeModelFromJson(String str) => List<NodeModel>.from(json.decode(str).map((x) => NodeModel.fromJson(x)));

String nodeModelToJson(List<NodeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NodeModel {
  String id;
  String name;
  int quantity;
  int price;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  NodeModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory NodeModel.fromJson(Map<String, dynamic> json) => NodeModel(
    id: json["_id"],
    name: json["name"],
    quantity: json["quantity"],
    price: json["price"],
    image: json["image"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "quantity": quantity,
    "price": price,
    "image": image,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
