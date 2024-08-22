import 'package:bloc/bloc.dart';
import 'package:movie_app/api_service/osman/api_maneger_movie_home.dart';

import 'movie_home_states_recomeded.dart';

class MovieHomeViewModelRecomended extends Cubit<MovieHomeStatesRecomended> {
  MovieHomeViewModelRecomended() : super(MovieHomeLoadingRecomended());

  Future<void> getRecomendedData() async {
    try {
      emit(MovieHomeLoadingRecomended());
      var response = await ApiManegerMovieHome.getRecomendedData();
      if (response?.message == null) {
        emit(MovieHomeSuccessRecomended(results: response!.results));
      }else{
        emit(MovieHomeErrorRecomended(errorMessage: response!.message!));

      }
    } catch (e) {
      emit(MovieHomeErrorRecomended(errorMessage: "Some Thing Went Wrong ,Please Check Your Connection"));
    }
  }




}
