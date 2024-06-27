import 'package:dartz/dartz.dart';
import 'package:task_2/core/app/data/datasources/base_app_data_source.dart';
import 'package:task_2/core/app/domain/repository/app_repository.dart';
import 'package:task_2/core/errors/faliure.dart';
import 'package:task_2/core/helper/get_failure.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

class AppRepositoryImpl extends AppRepository {
  final BaseAppDataSource baseAppDataSource;

  AppRepositoryImpl(this.baseAppDataSource);
  @override
  Future<Either<Failure, List<MoviesEntity>>> getMoreLikeThis(
    String movieName,
  ) async {
    try {
      final result =
          await baseAppDataSource.getMoreLikeThis(movieName: movieName);
      return right(result);
    } on Exception catch (e) {
      return left(getFailure(e));
    }
  }
}
