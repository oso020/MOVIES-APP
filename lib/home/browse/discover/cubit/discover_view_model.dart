import 'package:bloc/bloc.dart';
import 'package:movie_app/api_service/mohamed_ali/api_manager.dart';
import 'package:movie_app/home/browse/discover/cubit/discover_state.dart';

class DiscoverViewModel extends Cubit<DiscoverState>{

  DiscoverViewModel():super(DiscoverLoadingSate());

  void getResults(String genresId) async{
    try{
      emit(DiscoverLoadingSate());
      var response = await ApiManger.getDiscover(genresId);
      if(response?.status_code == 'error') {
        emit(DiscoverErrorSate(errorMessage: 'Error Loading Results For Chosen Category !'));
      }else{
        emit(DiscoverSuccessSate(resultsList: response!.results!));
      }
    }catch(e){
      emit(DiscoverErrorSate(errorMessage: 'Error Loading Results For Chosen Category !'));
    }
  }
}