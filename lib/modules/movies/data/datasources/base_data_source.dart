import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

abstract class BaseMovieDataSource {
  Future<List<MoviesEntity>> getNowPlayingMovies({int pageNumber = 1});
  Future<List<MoviesEntity>> getPopularMovies({int pageNumber = 1});
  Future<List<MoviesEntity>> getTopRatedMovies({int pageNumber = 1});
  Future<List<MoviesEntity>> getMoreLikeThis({required String movieName});
}
