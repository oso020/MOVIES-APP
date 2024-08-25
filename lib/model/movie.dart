import 'package:cloud_firestore/cloud_firestore.dart';

///data class
class Movie{
  static const String collectionName = "movies";

  String id;
  String title;
  String imageUrl;
  DateTime dateTime;
  bool isWatchList;

  Movie({this.id = '',required this.title,
    required this.imageUrl ,
    required this.dateTime,
    this.isWatchList = false});

  ///func object -> json
  Movie.FromFireStore(Map<String, dynamic> data):this(
    id: data["id"] as String,
    title: data["title"] as String,
      imageUrl: data["imageUrl"] as String,
      dateTime: parseDateTime(data["dateTime"]),
      isWatchList: data["isWatchList"] as bool
  );

  /// Helper function to parse dateTime from Firestore
  static DateTime parseDateTime(dynamic dateTimeData) {
    if (dateTimeData is Timestamp) {
      return dateTimeData.toDate();
    } else if (dateTimeData is int) {
      return DateTime.fromMillisecondsSinceEpoch(dateTimeData);
    } else if (dateTimeData is String) {
      return DateTime.parse(dateTimeData);
    } else {
      throw ArgumentError("Unsupported dateTime format: $dateTimeData");
    }
  }

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