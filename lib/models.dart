// To parse this JSON data, do
//
//     final sampleposts = samplepostsFromJson(jsonString);

//import 'dart:convert';

//List<Sampleposts> samplepostsFromJson(String str) => List<Sampleposts>.from(
// json.decode(str).map((x) => Sampleposts.fromJson(x)));

//String samplepostsToJson(List<Sampleposts> data) =>
//  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sampleposts {
  int userId;
  int id;
  String title;
  String body;

  Sampleposts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Sampleposts.fromJson(Map<String, dynamic> json) => Sampleposts(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
