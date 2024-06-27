import 'package:dartz/dartz.dart';
import 'package:task_2/core/errors/faliure.dart';
import 'package:task_2/modules/movies/data/datasources/base_data_source.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import '../../../../core/helper/get_failure.dart';
import '../../domain/repository/base_movie_repository.dart';

class MovieRepoImpl extends BaseMoviesRepository {
  final BaseMovieDataSource baseMovieDataSource;

  MovieRepoImpl(this.baseMovieDataSource);

  @override
  Future<Either<Failure, List<MoviesEntity>>> getNowPlayingMovies(
      {int pageNumber = 1}) async {
    try {
      final result =
          await baseMovieDataSource.getNowPlayingMovies(pageNumber: pageNumber);
      return right(result);
    } on Exception catch (e) {
      return left(getFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getPopularMovies(
      {int pageNumber = 1}) async {
    try {
      final result =
          await baseMovieDataSource.getPopularMovies(pageNumber: pageNumber);
      return right(result);
    } on Exception catch (e) {
      return left(getFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getTopRatedMovies(
      {int pageNumber = 1}) async {
    try {
      final result =
          await baseMovieDataSource.getTopRatedMovies(pageNumber: pageNumber);
      return right(result);
    } on Exception catch (e) {
      return left(getFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getMoreLikeThis(
    String movieName,
  ) async {
    try {
      final result =
          await baseMovieDataSource.getMoreLikeThis(movieName: movieName);
      return right(result);
    } on Exception catch (e) {
      return left(getFailure(e));
    }
  }
}
