import 'package:bloc/bloc.dart';
import 'package:movie_app/api_service/mohamed_ali/api_manager.dart';
import 'package:movie_app/home/browse/category/cubit/category_state.dart';

class BrowseScreenViewModel extends Cubit<BrowseState>{

  BrowseScreenViewModel():super(BrowseLoadingState());

  void getGenres() async{
    try{
      emit(BrowseLoadingState());
      var response = await ApiManger.getCategory();
      if(response?.status_code == 'error'){
        emit(BrowseErrorState(errorMessage: 'Error Loading Category Items'));
      }else{
        emit(BrowseSuccessState(genresList: response!.genres!));
      }
    }catch(e){
      emit(BrowseErrorState(errorMessage: 'Error Loading Category Items'));
    }
  }
}
