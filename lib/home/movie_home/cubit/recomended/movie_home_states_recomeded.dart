import 'package:movie_app/model/Recomended.dart';

import '../../../../model/Popular.dart';

abstract class MovieHomeStatesRecomended{}

class MovieHomeLoadingRecomended extends MovieHomeStatesRecomended {}
class MovieHomeSuccessRecomended extends MovieHomeStatesRecomended{
  List<ResultsRecomended>?results;

  MovieHomeSuccessRecomended({
    required this.results
  });
}
class MovieHomeErrorRecomended  extends MovieHomeStatesRecomended{
  String errorMessage;

  MovieHomeErrorRecomended({
    required this.errorMessage
  });
}
