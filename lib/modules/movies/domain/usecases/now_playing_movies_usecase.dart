import 'package:dartz/dartz.dart';
import 'package:task_2/core/errors/faliure.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

import '../repository/base_movie_repository.dart';

class NowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  NowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<MoviesEntity>>> execute(
      {int pageNumber = 1}) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
