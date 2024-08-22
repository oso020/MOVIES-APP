import 'package:movie_app/model/NewReleases.dart';

import '../../../../model/Popular.dart';

abstract class MovieHomeStatesNewReleases{}

class MovieHomeLoadingNewReleases extends MovieHomeStatesNewReleases {}
class MovieHomeSuccessNewReleases extends MovieHomeStatesNewReleases{
  List<ResultsNewReleases>?results;

  MovieHomeSuccessNewReleases({
    required this.results
});
}
class MovieHomeErrorNewReleases  extends MovieHomeStatesNewReleases{
  String errorMessage;

  MovieHomeErrorNewReleases({
    required this.errorMessage
  });
}
