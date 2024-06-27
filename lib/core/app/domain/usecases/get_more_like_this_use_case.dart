import 'package:dartz/dartz.dart';
import 'package:task_2/core/app/domain/repository/app_repository.dart';
import 'package:task_2/core/errors/faliure.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

class GetMoreLikeThisUseCase {
  final AppRepository appRepository;

  GetMoreLikeThisUseCase(this.appRepository);
  Future<Either<Failure, List<MoviesEntity>>> execute(String movieName) async {
    return appRepository.getMoreLikeThis(movieName);
  }
}
