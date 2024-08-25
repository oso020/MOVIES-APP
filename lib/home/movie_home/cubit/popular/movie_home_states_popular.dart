import '../../../../model/Popular.dart';

abstract class MovieHomeStatesPopular{}

class MovieHomeLoadingPopular extends MovieHomeStatesPopular {}
class MovieHomeSuccessPopular extends MovieHomeStatesPopular{
  List<ResultsPopular>?results;

  MovieHomeSuccessPopular({
    required this.results
});
}
class MovieHomeErrorPopular  extends MovieHomeStatesPopular{
  String errorMessage;

  MovieHomeErrorPopular({
    required this.errorMessage
  });
}


class BookedSwitch  extends MovieHomeStatesPopular{

}
