import 'package:bloc/bloc.dart';
import 'package:movie_app/api_service/osman/api_maneger_movie_home.dart';

import 'movie_home_states_popular.dart';

class MovieHomeViewModelPopular extends Cubit<MovieHomeStatesPopular> {
  MovieHomeViewModelPopular() : super(MovieHomeLoadingPopular());

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




}
