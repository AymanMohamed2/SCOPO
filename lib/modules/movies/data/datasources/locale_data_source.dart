import 'package:task_2/modules/movies/data/datasources/base_data_source.dart';
import 'package:task_2/modules/movies/domain/entities/now_playing_movies_entity.dart';

class LocalMovieDataSource extends BaseMovieDataSource {
  @override
  Future<List<MoviesEntity>> getMoreLikeThis({required String movieName}) {
    // TODO: implement getMoreLikeThis
    throw UnimplementedError();
  }

  @override
  Future<List<MoviesEntity>> getNowPlayingMovies({int pageNumber = 1}) {
    // TODO: implement getNowPlayingMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MoviesEntity>> getPopularMovies({int pageNumber = 1}) {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MoviesEntity>> getTopRatedMovies({int pageNumber = 1}) {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }
}
