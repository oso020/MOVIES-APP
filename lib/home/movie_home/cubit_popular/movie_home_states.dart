import '../../../model/Popular.dart';

abstract class MovieHomeStates{}

class MovieHomeLoading extends MovieHomeStates {}
class MovieHomeSuccess extends MovieHomeStates{
  List<Results>?results;

  MovieHomeSuccess({
    required this.results
});
}
class MovieHomeError extends MovieHomeStates{
  String? errorMessage;

  MovieHomeError({
    required this.errorMessage
  });
}
