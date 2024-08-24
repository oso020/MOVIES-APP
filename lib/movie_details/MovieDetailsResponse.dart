/// adult : false
/// backdrop_path : "/brCB5iUyE6xL94regWLNwcexwHi.jpg"
/// belongs_to_collection : null
/// budget : 0
/// genres : [{"id":28,"name":"Action"}]
/// homepage : ""
/// id : 53351
/// imdb_id : "tt0165247"
/// origin_country : ["HK","KR"]
/// original_language : "ko"
/// original_title : "인자문살수"
/// overview : "Dragon Kong, a victor of a millionaire's martial-arts contest, is about to begin the most dangerous mission of his life. For his prize, the millionaire's ravishing daughter Susan, has been stolen - kidnapped by a Ninja sect headed by Tiger So, a legendary Ninjitsu super-foot. Why Tiger has taken Susan, Dragon can only guess, but as the shocking truth begins to dawn, and the final showdown approaches, the violence of the Ninja reaches its fatal peak."
/// popularity : 4.645
/// poster_path : "/kCFAdggQkzwP0Y7T8D7CfviZz3.jpg"
/// production_companies : [{"id":45069,"logo_path":null,"name":"Kukje Movies","origin_country":""},{"id":25064,"logo_path":null,"name":"Asso Asia Films","origin_country":""}]
/// production_countries : [{"iso_3166_1":"HK","name":"Hong Kong"},{"iso_3166_1":"KR","name":"South Korea"}]
/// release_date : "1982-08-14"
/// revenue : 0
/// runtime : 95
/// spoken_languages : [{"english_name":"Korean","iso_639_1":"ko","name":"한국어/조선말"}]
/// status : "Released"
/// tagline : "The 200 year old sect of silent assassins - this time they've gone too far..."
/// title : "Secret Ninja, Roaring Tiger"
/// video : false
/// vote_average : 5.6
/// vote_count : 7

class MovieDetailsResponse {
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  bool? success;
  int? statusCode;
  String? statusMessage;

  // Constructor
  MovieDetailsResponse({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  // Factory constructor to handle JSON
  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    // Check if it's an error response
    if (json.containsKey('status_code')) {
      return MovieDetailsResponse(
        success: json['success'],
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
      );
    } else {
      // Handle successful response
      return MovieDetailsResponse(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        belongsToCollection: json['belongs_to_collection'],
        budget: json['budget'],
        genres: (json['genres'] as List<dynamic>?)
            ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
            .toList(),
        homepage: json['homepage'],
        id: json['id'],
        imdbId: json['imdb_id'],
        originCountry:
            (json['origin_country'] as List<dynamic>?)?.cast<String>(),
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        productionCompanies: (json['production_companies'] as List<dynamic>?)
            ?.map(
                (e) => ProductionCompanies.fromJson(e as Map<String, dynamic>))
            .toList(),
        productionCountries: (json['production_countries'] as List<dynamic>?)
            ?.map(
                (e) => ProductionCountries.fromJson(e as Map<String, dynamic>))
            .toList(),
        releaseDate: json['release_date'],
        revenue: json['revenue'],
        runtime: json['runtime'],
        spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
            ?.map((e) => SpokenLanguages.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'],
        tagline: json['tagline'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
        success: true,
        statusCode: 200,
      );
    }
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (success != null) {
      map['success'] = success;
      map['status_code'] = statusCode;
      map['status_message'] = statusMessage;
    } else {
      map['adult'] = adult;
      map['backdrop_path'] = backdropPath;
      map['belongs_to_collection'] = belongsToCollection;
      map['budget'] = budget;
      map['genres'] = genres?.map((v) => v.toJson()).toList();
      map['homepage'] = homepage;
      map['id'] = id;
      map['imdb_id'] = imdbId;
      map['origin_country'] = originCountry;
      map['original_language'] = originalLanguage;
      map['original_title'] = originalTitle;
      map['overview'] = overview;
      map['popularity'] = popularity;
      map['poster_path'] = posterPath;
      map['production_companies'] =
          productionCompanies?.map((v) => v.toJson()).toList();
      map['production_countries'] =
          productionCountries?.map((v) => v.toJson()).toList();
      map['release_date'] = releaseDate;
      map['revenue'] = revenue;
      map['runtime'] = runtime;
      map['spoken_languages'] =
          spokenLanguages?.map((v) => v.toJson()).toList();
      map['status'] = status;
      map['tagline'] = tagline;
      map['title'] = title;
      map['video'] = video;
      map['vote_average'] = voteAverage;
      map['vote_count'] = voteCount;
    }
    return map;
  }
}

/// english_name : "Korean"
/// iso_639_1 : "ko"
/// name : "한국어/조선말"

class SpokenLanguages {
  SpokenLanguages({
    this.englishName,
    this.iso6391,
    this.name,
  });

  SpokenLanguages.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  String? englishName;
  String? iso6391;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = englishName;
    map['iso_639_1'] = iso6391;
    map['name'] = name;
    return map;
  }
}

/// iso_3166_1 : "HK"
/// name : "Hong Kong"

class ProductionCountries {
  ProductionCountries({
    this.iso31661,
    this.name,
  });

  ProductionCountries.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  String? iso31661;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    return map;
  }
}

/// id : 45069
/// logo_path : null
/// name : "Kukje Movies"
/// origin_country : ""

class ProductionCompanies {
  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  ProductionCompanies.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  int? id;
  dynamic logoPath;
  String? name;
  String? originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo_path'] = logoPath;
    map['name'] = name;
    map['origin_country'] = originCountry;
    return map;
  }
}

/// id : 28
/// name : "Action"

class Genres {
  Genres({
    this.id,
    this.name,
  });

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
