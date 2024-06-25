import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';

class Result extends TvEntity {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
            title: name,
            image: backdropPath,
            description: overview,
            releaseDate: firstAirDate,
            rating: voteAverage);

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json['adult'] as bool,
        backdropPath: json['backdrop_path'] == null
            ? null
            : json['backdrop_path'] as String,
        genreIds: List<int>.from(json['genre_ids'].map((x) => x as int)),
        id: json['id'] as int,
        originCountry:
            List<String>.from(json['origin_country'].map((x) => x as String)),
        originalLanguage: json['original_language'] as String,
        originalName: json['original_name'] as String,
        overview: json['overview'] as String,
        popularity: json['popularity'] as double,
        posterPath:
            json['poster_path'] == null ? null : json['poster_path'] as String,
        firstAirDate: json['first_air_date'] as String,
        name: json['name'] as String,
        voteAverage: json['vote_average'] as double,
        voteCount: json['vote_count'] as int,
      );
}
