import 'package:movie_app/movie_details/MovieDetailsResponse.dart';

import '../model/SimilarMovies.dart';
import 'SimilarMoviesResponse.dart';

abstract class MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  MovieDetailsResponse movieDetails;
  List<SimilarMovie> similarMoviesList = [];
  int movieId;

  // Add this line

  MovieDetailsSuccess({
    required this.movieDetails,
    required this.similarMoviesList,
    required this.movieId,
    // Update constructor
  });
}


class MovieDetailsError extends MovieDetailsState {
  String status_message;

  MovieDetailsError({required this.status_message});
}