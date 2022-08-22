import "package:flutter/material.dart";

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

//getting a list of models,
//this return a  list of PostModel by taking a String
//this method takes the content of str, decodes it and map out it content then convert it to a PostModel.
List<PostModel> PostModelFromJson(String str) => List<PostModel>.from(
      jsonDecode(str).map(
            (x) => PostModel.fromJson(x),
          ),
    );

//turn a list of PostModels into an encoded String
String PostModelToJson(List<PostModel> data) => jsonEncode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

//post model
class PostModel {
  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  // a factory constructor that takes a map and convert it to a PostModel type
  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  //a method that convert a PostModel into a Json
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}