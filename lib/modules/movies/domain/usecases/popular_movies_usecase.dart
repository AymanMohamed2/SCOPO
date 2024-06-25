import 'package:dartz/dartz.dart';
import 'package:task_2/core/errors/faliure.dart';

import '../entities/now_playing_movies_entity.dart';
import '../repository/base_movie_repository.dart';

class PopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  PopularMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<MoviesEntity>>> execute(
      {int pageNumber = 1}) async {
    return await baseMoviesRepository.getPopularMovies(pageNumber: pageNumber);
  }
}
