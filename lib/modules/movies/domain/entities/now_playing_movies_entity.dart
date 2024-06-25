class MoviesEntity {
  final String? image;
  final String title;
  final String overview;
  final double voteAverage;
  final String date;

  MoviesEntity(
      {required this.image,
      required this.title,
      required this.overview,
      required this.date,
      required this.voteAverage});
}
