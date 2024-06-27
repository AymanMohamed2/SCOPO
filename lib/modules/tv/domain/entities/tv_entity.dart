import 'package:task_2/core/app/domain/entities/base_movie_entity.dart';

class TvEntity extends BaseMovieEntity {
  TvEntity(
      {required super.image,
      required super.title,
      required super.overview,
      required super.voteAverage,
      required super.date});
}
