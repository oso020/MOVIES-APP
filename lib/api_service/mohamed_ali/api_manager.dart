import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/category.dart';
import 'package:movie_app/api_service/mohamed_ali/api_constant.dart';
import 'package:movie_app/model/discover.dart';
import 'package:movie_app/model/search.dart';

class ApiManger{
  //https://api.themoviedb.org/3/search/movie

  static Future<SearchResponse?> getSearch({required String query}) async{
    Uri url = Uri.https(
        ApiConstens.baseUrl,
        ApiConstens.searchApi,
        {
          'api_key' : ApiConstens.apiKey,
          'query' : query
        }
    );

    var searchResponse = await http.get(url);
    try{
      var searchBody = searchResponse.body;
      var json = jsonDecode(searchBody);
      return SearchResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }

  static Future<CategoryResponse?> getCategory() async{
   Uri url = Uri.https(
     ApiConstens.baseUrl,
     ApiConstens.categoryApi,
     {
       'api_key' : ApiConstens.apiKey,
     }
   );
   var categoryResponse = await http.get(url);
   try{
     return CategoryResponse.fromJson(jsonDecode(categoryResponse.body));
   }catch(e){
     throw e;
   }
  }

  static Future<DiscoverResponse?> getDiscover(String genresId) async{
    Uri url = Uri.https(
        ApiConstens.baseUrl,
        ApiConstens.discoverApi,
        {
          'api_key' : ApiConstens.apiKey,
          'with_genres' : genresId
        }
    );
    var discoverResponse = await http.get(url);
    try{
      return DiscoverResponse.fromJson(jsonDecode(discoverResponse.body));
    }catch(e){
      throw e;
    }
  }
}