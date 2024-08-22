import 'package:bloc/bloc.dart';
import 'package:movie_app/api_service/osman/api_maneger_movie_home.dart';
import 'package:movie_app/home/movie_home/cubit/new_releases/movie_home_states_NewReleases.dart';

import '../popular/movie_home_states_popular.dart';

class MovieHomeViewModelNewReleases extends Cubit<MovieHomeStatesNewReleases> {
  MovieHomeViewModelNewReleases() : super(MovieHomeLoadingNewReleases());

  Future<void> getNewReleasesData() async {
    try {
      emit(MovieHomeLoadingNewReleases());
      var response = await ApiManegerMovieHome.getNewReleasesData();
      if (response?.message == null) {
        emit(MovieHomeSuccessNewReleases(results: response!.results));
      }else{
        emit(MovieHomeErrorNewReleases(errorMessage: response!.message!));

      }
    } catch (e) {
      emit(MovieHomeErrorNewReleases(errorMessage: "Some Thing Went Wrong ,Please Check Your Connection"));
    }
  }




}
