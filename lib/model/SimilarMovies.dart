class Movie {
  int id;
  String title;
  String posterPath;
  String releaseDate;
  double voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.posterPath,
  });
}
