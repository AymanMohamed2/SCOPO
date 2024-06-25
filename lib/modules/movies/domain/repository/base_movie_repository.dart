import 'package:dartz/dartz.dart';
import 'package:task_2/core/errors/faliure.dart';

import '../entities/now_playing_movies_entity.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MoviesEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MoviesEntity>>> getPopularMovies(
      {int pageNumber = 1});
  Future<Either<Failure, List<MoviesEntity>>> getTopRatedMovies(
      {int pageNumber = 1});
}
