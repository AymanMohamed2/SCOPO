import 'package:task_2/core/entities/base_movie_entity.dart';

class MoviesEntity extends BaseMovieEntity {
  MoviesEntity(
      {required super.image,
      required super.title,
      required super.overview,
      required super.voteAverage,
      required super.date});
}
