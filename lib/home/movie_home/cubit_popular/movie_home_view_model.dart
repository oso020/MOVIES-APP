import 'package:bloc/bloc.dart';
import 'package:movie_app/api_service/osman/api_maneger_movie_home.dart';

import 'movie_home_states.dart';

class MovieHomeViewModel extends Cubit<MovieHomeStates> {
  MovieHomeViewModel() : super(MovieHomeLoading());

  Future<void> getPopularData() async {
    try {
      emit(MovieHomeLoading());
      var response = await ApiManegerMovieHome.getPopularData();
      if (response?.message == null) {
        emit(MovieHomeSuccess(results: response!.results));
      }else{
        emit(MovieHomeError(errorMessage: response!.message!));

      }
    } catch (e) {
      emit(MovieHomeError(errorMessage: e.toString()));
    }
  }
}
