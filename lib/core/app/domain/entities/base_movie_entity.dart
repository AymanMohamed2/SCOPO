abstract class BaseMovieEntity {
  final String? image;
  final String title;
  final String overview;
  final double voteAverage;
  final String date;

  BaseMovieEntity(
      {required this.image,
      required this.title,
      required this.overview,
      required this.voteAverage,
      required this.date});
}
