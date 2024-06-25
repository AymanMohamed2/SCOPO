import 'package:dartz/dartz.dart';
import 'package:task_2/core/errors/faliure.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';
import 'package:task_2/modules/movies/domain/repository/base_movie_repository.dart';

class GetMoreLikeThisUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoreLikeThisUseCase(this.baseMoviesRepository);
  Future<Either<Failure, List<MoviesEntity>>> execute(String movieName) async {
    return baseMoviesRepository.getMoreLikeThis(movieName);
  }
}
