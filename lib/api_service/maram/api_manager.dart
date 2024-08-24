import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api_service/maram/api_constants.dart';
import 'package:movie_app/movie_details/MovieDetailsResponse.dart';
import 'package:movie_app/movie_details/SimilarMoviesResponse.dart';

class ApiManager {
  static const String authorization =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNWNmOWIxMDdiMWI5MDRmNWFjNTIyMzM2MGY5MWQ2NCIsIm5iZiI6MTcyNDM1NTAxMy42NzU5Mywic3ViIjoiNjZjNzhlZjBlMzA5MTdhYTEwYjJlNjZjIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.AY0pYjgTa02Yt586sVFj8Ts0UCHflTsqtMiKKEImvnk";

  static Future<MovieDetailsResponse?> getMovieDetailsById(int movieId) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      '${ApiConstants.apiVersion}${ApiConstants.movieDetailsApi}$movieId',
    );

    Map<String, String> headers = {
      'Authorization': authorization,
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(url, headers: headers);
      // print('Status code: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return MovieDetailsResponse.fromJson(json);
      } else {
        var errorJson = jsonDecode(response.body);
        return MovieDetailsResponse(
          success: false,
          statusCode: response.statusCode,
          statusMessage: errorJson['status_message'] ?? 'unknown error',
        );
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  static Future<SimilarMoviesResponse?> getSimilarMoviesById(
      int movieId) async {
    Uri url = Uri.http(
      ApiConstants.baseUrl,
      '${ApiConstants.apiVersion}${ApiConstants.movieDetailsApi}$movieId${ApiConstants.similarApi}',
    );
    Map<String, String> headers = {
      'Authorization': authorization,
      'Content-Type': 'application/json',
    };
    try {
      var response = await http.get(url, headers: headers);
      // print('Status code: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        // print('Full error response: ${response.body}');

        return SimilarMoviesResponse.fromJson(json);
      } else {
        var errorJson = jsonDecode(response.body);
        return SimilarMoviesResponse(
          success: false,
          status_code: response.statusCode,
          status_message: errorJson['status_message'] ?? 'unknown error',
        );
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
