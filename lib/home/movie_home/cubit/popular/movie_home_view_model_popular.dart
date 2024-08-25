import 'package:bloc/bloc.dart';
import 'package:movie_app/api_service/osman/api_maneger_movie_home.dart';
import 'package:movie_app/firebase_utils.dart';

import '../../../../model/Popular.dart';
import '../../../../model/movie.dart';
import 'movie_home_states_popular.dart';

class MovieHomeViewModelPopular extends Cubit<MovieHomeStatesPopular> {
  MovieHomeViewModelPopular() : super(MovieHomeLoadingPopular());
  bool isBooked=false;
  Future<void> getPopularData() async {
    try {
      emit(MovieHomeLoadingPopular());
      var response = await ApiManegerMovieHome.getPopularData();
      if (response?.message == null) {
        emit(MovieHomeSuccessPopular(results: response!.results));
      }else{
        emit(MovieHomeErrorPopular(errorMessage: response!.message!));

      }
    } catch (e) {
      emit(MovieHomeErrorPopular(errorMessage: "Some Thing Went Wrong ,Please Check Your Connection"));
    }
  }


  switchBooked(ResultsPopular results) async {
    // Check the current state of the movie in Firestore
      // If the movie is not currently booked, book it
    isBooked=!isBooked;
    emit(BookedSwitch()); //
      await FirebaseUtils.addMovieToFireStore(
        Movie(
          id: results.id.toString(),
          title: results.originalTitle ?? "",
          imageUrl: results.posterPath ?? "",
          dateTime: DateTime.parse(results.releaseDate ?? ""),
        ),
      );


  }


}
