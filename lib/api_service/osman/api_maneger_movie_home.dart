import 'dart:convert';

import 'package:movie_app/api_service/osman/api_constant_osman.dart';
import 'package:http/http.dart'as http;
import 'package:movie_app/model/Popular.dart';

import '../../model/NewReleases.dart';
import '../../model/Recomended.dart';
class ApiManegerMovieHome{

  static Future<Popular?> getPopularData()async{
    Uri url =Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.apiLinkPopular,
    );
    Map<String,String>?headers={
      "Authorization":ApiConstant.authorization  ,
      "accept":ApiConstant.accept  ,
    };

    var response=await http.get(url,headers: headers);
    var stringResponse=response.body;
    var stringToJson=jsonDecode(stringResponse);
    return Popular.fromJson(stringToJson);

  }

  static Future<NewReleases?> getNewReleasesData()async{
    Uri url =Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.apiLinkNewReleases,
    );
    Map<String,String>?headers={
      "Authorization":ApiConstant.authorization  ,
      "accept":ApiConstant.accept  ,
    };

    var response=await http.get(url,headers: headers);
    var stringResponse=response.body;
    var stringToJson=jsonDecode(stringResponse);
    return NewReleases.fromJson(stringToJson);

  }

  static Future<Recomended?> getRecomendedData()async{
    Uri url =Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.apiLinkRecomended,
    );
    Map<String,String>?headers={
      "Authorization":ApiConstant.authorization  ,
      "accept":ApiConstant.accept  ,
    };

    var response=await http.get(url,headers: headers);
    var stringResponse=response.body;
    var stringToJson=jsonDecode(stringResponse);
    return Recomended.fromJson(stringToJson);

  }




}