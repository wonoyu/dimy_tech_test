import 'dart:convert';

import 'package:flutter/foundation.dart';

class HotCoffee {
  HotCoffee({
    this.title,
    this.description,
    this.ingredients,
    this.image,
    this.id,
  });

  String? title;
  String? description;
  List<String>? ingredients;
  String? image;
  int? id;

  factory HotCoffee.fromJson(Map<String, dynamic> json) => HotCoffee(
        title: json['title'],
        description: json['description'],
        ingredients: List<String>.from(
            json['ingredients'].map((ingredient) => ingredient)),
        image: json['image'],
        id: json['id'],
      );

  static Map<String, dynamic> toJson(HotCoffee hotCoffee) => {
        "title": hotCoffee.title,
        "description": hotCoffee.description,
        "ingredients": hotCoffee.ingredients,
        "image": hotCoffee.image,
        "id": hotCoffee.id,
      };
}

class IsolateParser {
  IsolateParser();

  Future<List<HotCoffee>> decodeIsolate(String encodedJson) {
    return compute(_decodeAndParseJson, encodedJson);
  }

  Future<String> encodeIsolate(HotCoffee hotCoffee) {
    return compute(_encodeToJson, hotCoffee);
  }

  List<HotCoffee> _decodeAndParseJson(String encodedJson) {
    final decodedJson = jsonDecode(encodedJson);
    final hotCoffee = List<HotCoffee>.from(
        decodedJson.map((hotCoffee) => HotCoffee.fromJson(hotCoffee)));
    hotCoffee.sort((b, a) => a.id!.compareTo(b.id!));
    return hotCoffee;
  }

  String _encodeToJson(HotCoffee hotCoffee) {
    final encodedJson = jsonEncode(HotCoffee.toJson(hotCoffee));
    return encodedJson;
  }
}
