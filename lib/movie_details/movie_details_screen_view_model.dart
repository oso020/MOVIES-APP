import 'package:bloc/bloc.dart';
import 'package:movie_app/api_service/maram/api_manager.dart';
import 'package:movie_app/movie_details/movie_details_screen_states.dart';

import '../model/SimilarMovies.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsState> {
  MovieDetailsViewModel() : super(MovieDetailsLoading());

  Future<void> fetchMovieDetails(int movieId) async {
    emit(MovieDetailsLoading());
    try {
      // check on movieDetailsResponse
      var movieDetailsResponse = await ApiManager.getMovieDetailsById(movieId);
      if (movieDetailsResponse == null ||
          movieDetailsResponse.statusCode != 200) {
        emit(MovieDetailsError(
          status_message:
              'error at loading movie details: ${movieDetailsResponse?.statusMessage ?? 'Unknown error'} (Code: ${movieDetailsResponse?.statusCode})',
        ));
        return;
      }

      // check on similarMoviesResponse
      var similarMoviesResponse =
          await ApiManager.getSimilarMoviesById(movieId);
      if (similarMoviesResponse == null) {
        emit(MovieDetailsError(
            status_message: 'similar movies response is null.'));
        return;
      }
      if (similarMoviesResponse.status_code != 200) {
        emit(MovieDetailsError(
            status_message:
                'error at loading similar movies: ${similarMoviesResponse.status_message ?? 'unknown error'} (code: ${similarMoviesResponse.status_code})'));
      }
      if (similarMoviesResponse.results == null ||
          similarMoviesResponse.results!.isEmpty) {
        emit(MovieDetailsError(
          status_message: 'No similar movies found.',
        ));
        return;
      }

      List<Movie> similarMoviesList =
          similarMoviesResponse.results!.map((data) {
        return Movie(
          id: data.id ?? 0,
          title: data.title ?? "",
          posterPath: data.posterPath ?? "",
          releaseDate: data.releaseDate ?? "",
          voteAverage: data.voteAverage ?? 0,
        );
      }).toList();
      emit(MovieDetailsSuccess(
        movieId: movieId,
        movieDetails: movieDetailsResponse,
        similarMoviesList: similarMoviesList,
      ));
    } catch (e) {
      emit(MovieDetailsError(status_message: e.toString()));
    }
  }
}
