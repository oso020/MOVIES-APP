import 'package:bloc/bloc.dart';
import 'package:movie_app/home/search/cubit/search_state.dart';

import '../../../api_service/mohamed_ali/api_manager.dart';

class SearchViewModel extends Cubit<SearchState>{

  SearchViewModel():super(SearchLoadingState());
  String searchText = '';

  void getSearch(String query)async {
    try{
      emit(SearchLoadingState());
      var response = await ApiManger.getSearch(query: query);
      if(response?.status_code == 'error'){
        emit(SearchErrorState(errorMessage: "Error Loading Search Items"));
      }else{

        emit(SearchSuccessState(resultsList: response!.results!));
      }
    }catch(e){
      emit(SearchErrorState(errorMessage: "Error Loading Search Items"));
    }
  }
  void isSearching(String query){
    searchText = query;
    getSearch(searchText);
    emit(IsSearchingState());
  }
}

