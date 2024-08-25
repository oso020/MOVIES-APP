import 'package:movie_app/movie_details/MovieDetailsResponse.dart';

import '../model/SimilarMovies.dart';

abstract class MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  MovieDetailsResponse movieDetails;
  List<Movie> similarMoviesList = [];
  int movieId;

  MovieDetailsSuccess(
      {required this.movieDetails,
      required this.similarMoviesList,
      required this.movieId});
}

class MovieDetailsError extends MovieDetailsState {
  String status_message;

  MovieDetailsError({required this.status_message});
}
