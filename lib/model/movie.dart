import 'package:cloud_firestore/cloud_firestore.dart';

///data class
class Movie{
  static const String collectionName = "movies";

  String id;
  String title;
  String imageUrl;
  dynamic dateTime;
  bool isWatchList;

  Movie({this.id = '',required this.title,
    required this.imageUrl ,required this.dateTime, this.isWatchList = false});

  ///func object -> json
  Movie.FromFireStore(Map<String, dynamic> data):this(
    id: data["id"] as String,
    title: data["title"] as String,
      imageUrl: data["imageUrl"] as String,
    dateTime: (data["dateTime"] as Timestamp).toString(),
      isWatchList: data["isWatchList"] as bool
  );

  ///func object -> json
  Map<String, dynamic> toFireStore(){
    return {
      "id" : id,
      "title" : title,
      "imageUrl" : imageUrl,
      "dateTime" : dateTime,
      "isWatchList" : isWatchList,
    };
  }
}