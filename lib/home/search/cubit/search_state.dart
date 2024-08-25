import '../../../model/search.dart';

abstract class SearchState{}
class SearchLoadingState extends SearchState{}
class SearchErrorState extends SearchState{
  String errorMessage;
  SearchErrorState({required this.errorMessage});
}
class SearchSuccessState extends SearchState{
  List<Results> resultsList;
  SearchSuccessState({required this.resultsList});
}
class IsSearchingState extends SearchState{
  /*List<Results> resultsListSearch;
  IsSearchingState({required this.resultsListSearch});*/
}