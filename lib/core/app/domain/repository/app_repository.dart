import 'package:dartz/dartz.dart';
import 'package:task_2/core/errors/faliure.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

abstract class AppRepository {
  Future<Either<Failure, List<MoviesEntity>>> getMoreLikeThis(String movieName);
}
