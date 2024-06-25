import 'package:task_2/modules/movies/data/models/movies_model/dates.dart';
import 'package:task_2/modules/movies/data/models/movies_model/movie.dart';

class MovieModel {
  final Dates? dates;
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MovieModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      dates: json['dates'] == null
          ? null
          : Dates.fromJson(json['dates'] as Map<String, dynamic>),
      page: json['page'] as int,
      results: (json['results'] as List)
          .map((movieJson) => Movie.fromJson(movieJson as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }
}
