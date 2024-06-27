import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

abstract class BaseAppDataSource {
  Future<List<MoviesEntity>> getMoreLikeThis({required String movieName});
}
