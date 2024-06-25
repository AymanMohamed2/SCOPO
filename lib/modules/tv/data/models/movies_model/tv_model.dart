import 'package:task_2/modules/tv/data/models/movies_model/result.dart';

class TvShow {
  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  TvShow({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TvShow.fromJson(Map<String, dynamic> json) => TvShow(
        page: json['page'] as int,
        results: List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
        totalPages: json['total_pages'] as int,
        totalResults: json['total_results'] as int,
      );
}

