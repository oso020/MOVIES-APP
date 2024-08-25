import '../../../../model/category.dart';

abstract class BrowseState{} //todo parent class
class BrowseLoadingState extends BrowseState{}
class BrowseErrorState extends BrowseState{
  String errorMessage;
  BrowseErrorState({required this.errorMessage});
}
class BrowseSuccessState extends BrowseState{
  List<Genres> genresList;
  BrowseSuccessState({required this.genresList});
}